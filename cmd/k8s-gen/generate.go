package cmd

import (
	"context"
	"fmt"
	"log/slog"
	"maps"
	"net/url"
	"os"
	"path/filepath"

	"github.com/thisisibrahimd/k8s/pkg/compiler/jsonschemacompiler"
	"github.com/thisisibrahimd/k8s/pkg/config"
	"github.com/thisisibrahimd/k8s/pkg/format"
	"github.com/thisisibrahimd/k8s/pkg/model"
	"github.com/thisisibrahimd/k8s/pkg/swagger"
	"github.com/thisisibrahimd/k8s/pkg/targetgenerator"
	"github.com/thisisibrahimd/k8s/pkg/util"
	"github.com/thisisibrahimd/k8s/pkg/writer"
	"github.com/mdobak/go-xerrors"
	"github.com/santhosh-tekuri/jsonschema/v6"
	"github.com/urfave/cli/v3"
)

func newGenerateCommand() *cli.Command {
	cmd := &cli.Command{
		Name:  "generate",
		Usage: "generate jsonnet libraries from crds, openapi, or jsonschema",
	}

	cmd.Commands = append(cmd.Commands, newK8sGenerateCommand())
	cmd.Commands = append(cmd.Commands, newJsonSchemaGenerateCommand())
	return cmd
}

func newK8sGenerateCommand() *cli.Command {
	cmd := &cli.Command{
		Name:        "k8s",
		Usage:       "generate jsonnet libraries from crds or openapi specs.",
		Description: "generate jsonnet libraries for Kubernetes from crds or openapi specs.",
	}

	cmd.Action = func(ctx context.Context, c *cli.Command) error {
		// parse config
		configFile := c.String("config")
		absConfigFile, err := filepath.Abs(configFile)
		if err != nil {
			panic(err)
		}
		configDir := filepath.Dir(absConfigFile)
		if err := os.Chdir(configDir); err != nil {
			panic(err)
		}

		cfg, err := config.Load(absConfigFile)
		if err != nil {
			panic(err)
		}
		err = config.Validate(cfg)
		if err != nil {
			panic(err)
		}
		slog.Debug("loaded config file", slog.String("file", configFile))

		// generate targets from specGenerator
		if cfg.SpecGenerator != nil {
			tg, err := targetgenerator.New(*cfg.SpecGenerator)
			if err != nil {
				return xerrors.New("failed to create target generator", err)
			}

			specs, err := tg.GenerateTargets()
			if err != nil {
				return xerrors.New("failed to generate targets", err)
			}
			cfg.Specs = specs
		}

		// inform user of filtering
		args := c.Args().Slice()
		if len(args) > 0 {
			slog.Warn("filtering generation to listed versions", slog.Any("versions", args))
		}

		// generate all target in config
		for _, t := range cfg.Specs {
			if len(args) > 0 && !util.HasStr(args, t.Output) {
				slog.Debug("skipping version", slog.String("version", t.Output))
				continue
			}

			prefix := ""
			if cfg.SpecGenerator != nil {
				prefix = cfg.SpecGenerator.Prefix
			}
			if t.Prefix != "" {
				prefix = t.Prefix
			}

			swaggerDefs := make(swagger.Definitions)
			if len(t.Crds) > 0 {
				for _, url := range t.Crds {
					slog.Info(
						"generating spec",
						slog.String("version", t.Output),
						slog.String("spec", url),
						slog.String("prefix", prefix),
					)

					loadedDefs, err := swagger.Load(&swagger.CRDLoader{}, url)
					if err != nil {
						return xerrors.New("unable to load spec", err)
					}
					maps.Copy(swaggerDefs, loadedDefs)
				}
			} else {
				slog.Info(
					"generating spec",
					slog.String("version", t.Output),
					slog.String("spec", t.Openapi),
					slog.String("prefix", prefix),
				)

				loadedDefs, err := swagger.Load(&swagger.SwaggerLoader{}, t.Openapi)
				if err != nil {
					return xerrors.New("unable to load spec", err)
				}
				swaggerDefs = loadedDefs
			}

			groups := model.Load(&swaggerDefs, prefix)
			path := filepath.Join(cfg.OutputDir, t.Output)

			// write libsonnet files to disk
			diskWriter := writer.NewDiskWriter()
			if err := diskWriter.Render(path, groups, t, cfg.LibName, cfg.Description); err != nil {
				return xerrors.New("failed to write libsonnet files", err)
			}
		}

		return nil
	}

	return cmd
}

func newJsonSchemaGenerateCommand() *cli.Command {
	cmd := &cli.Command{
		Name:        "jsonschema",
		Description: "generate jsonnet libraries from jsonschema",
	}

	cmd.Flags = append(cmd.Flags, &cli.StringFlag{
		Name:  "schema",
		Value: "schema.json",
		Usage: "jsonschema file. can be url or filepath",
		Validator: func(s string) error {
			if s == "" {
				return xerrors.New("schema not provided")
			}

			url, urlErr := url.Parse(s)
			var isUrl bool
			if urlErr == nil && (url.Scheme == "http" || url.Scheme == "https") {
				isUrl = true
			}

			fileInfo, fileErr := os.Stat(s)
			var isFile bool
			if fileErr == nil && !fileInfo.IsDir() {
				isFile = true
			}

			if !isFile && !isUrl {
				return xerrors.New("schema is neiher a url nor a file that exists")
			}

			return nil
		},
		Required: true,
	})

	cmd.Flags = append(cmd.Flags, &cli.StringFlag{
		Name:  "output",
		Usage: "libsonnet file",
	})

	cmd.Action = func(ctx context.Context, c *cli.Command) error {
		jsonschemaFile := c.String("schema")
		slog.Debug("generating libsonnet library from jsonschema", slog.String("schema", jsonschemaFile))

		// create jsonschema compiler
		comp := jsonschema.NewCompiler()

		// setup loader for local file and remote urls
		l, _ := jsonschemacompiler.NewLoader(false, "")
		comp.UseLoader(l)
		slog.Debug("configured loader based on schema")

		// load jsonschema
		sch, err := comp.Compile(jsonschemaFile)
		if err != nil {
			return xerrors.New("error compiling schema", err)
		}
		slog.Debug("complied schema", slog.Int("version", sch.DraftVersion))

		// compile jsonschema into libsonnet
		libsonnetFile := jsonschemacompiler.CompileLibsonnet(sch, "schema", []string{})
		slog.Debug("generated libsonnet files")

		// format libsonnet file
		formattedLibsonnetFile, err := format.Format("", libsonnetFile.String())
		if err != nil {
			return err
		}
		slog.Debug("formatted libsonnet file")

		// output libsonnet either to stdout or file
		if c.String("output") == "" {
			fmt.Print(formattedLibsonnetFile)
		} else {

			err = os.WriteFile(c.String("output"), []byte(formattedLibsonnetFile), 0o644)
			if err != nil {
				return err
			}

		}
		return nil
	}

	return cmd
}
