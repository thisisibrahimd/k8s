package cmd

import (
	"context"
	"log/slog"
	"os"

	"github.com/jsonnet-libs/k8s/pkg/telemetry"
	"github.com/urfave/cli/v3"
)

func NewRootCommand() *cli.Command {
	// command
	cmd := &cli.Command{
		Name:        "k8s-gen",
		Usage:       "k8s-gen [global options] <command> [command options]",
		Description: "k8s-gen generates Jsonnet libraries from OpenAPI specs, CRDs, or JSON Schema",
	}

	// flags
	cmd.Flags = append(cmd.Flags, &cli.StringFlag{
		Name:  "config",
		Value: "config.json",
		Usage: "json config file",
	})
	cmd.Flags = append(cmd.Flags, &cli.BoolFlag{
		Name:  "debug",
		Value: false,
		Usage: "debug logging",
	})

	// before: set logger
	cmd.Before = func(ctx context.Context, c *cli.Command) (context.Context, error) {
		// logging
		opts := slog.HandlerOptions{
			AddSource: false,
			Level:     telemetry.NewLoggingLevel(c.Bool("debug")),
		}
		l := slog.New(slog.NewTextHandler(os.Stdout, &opts))
		slog.SetDefault(l)

		return ctx, nil
	}

	// action

	cmd.Commands = append(cmd.Commands, newGenerateCommand())

	return cmd
}
