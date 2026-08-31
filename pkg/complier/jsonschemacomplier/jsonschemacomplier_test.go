package jsonschemacomplier_test

import (
	"testing"

	"github.com/google/go-jsonnet/formatter"
	"github.com/thisisibrahimd/k8s/pkg/complier/jsonschemacomplier"
	"github.com/santhosh-tekuri/jsonschema/v6"
	"github.com/sebdah/goldie/v2"
)

// verifyLibsonnetFileMatch verify that the generated libsonnet file matches the golden libsonnet file in our golden directory
func verifyLibsonnetFileMatch(t *testing.T, v []byte) {
	g := goldie.New(
		t,
		goldie.WithFixtureDir("./testdata"),
		goldie.WithNameSuffix(".golden.libsonnet"),
		goldie.WithTestNameForDir(false),
		goldie.WithSubTestNameForDir(false),
	)

	g.Assert(t, t.Name(), v)
}

func TestCompileLibsonnet(t *testing.T) {
	// create jsonschema compiler
	comp := jsonschema.NewCompiler()
	l, _ := jsonschemacomplier.NewLoader(false, "")
	comp.UseLoader(l)

	// setup jsonnet formatter options
	formatOpts := formatter.DefaultOptions()

	tests := []struct {
		name       string // description of this test case
		schema     *jsonschema.Schema
		schemaName string
		curPath    []string
	}{
		{
			name:   "golangci-schema",
			schema: comp.MustCompile("testdata/golangci-schema.json"),
		},
		{
			name:   "kind-schema",
			schema: comp.MustCompile("testdata/kind-schema.json"),
		},
		{
			name:   "identity-schema",
			schema: comp.MustCompile("testdata/identity-schema.json"),
		},
		{
			name:   "kratos-schema",
			schema: comp.MustCompile("testdata/kratos-schema.json"),
		},
		{
			name:   "simple-schema",
			schema: comp.MustCompile("testdata/simple-schema.json"),
		},
		{
			name:   "tslint-schema",
			schema: comp.MustCompile("testdata/tslint-schema.json"),
		},
		{
			name:   "map-test-schema",
			schema: comp.MustCompile("testdata/map-test-schema.json"),
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			// compile jsonschema into libsonnet
			got := jsonschemacomplier.CompileLibsonnet(tt.schema, "schema", []string{})

			// format the generated libsonnet file
			formattedLibsonnet, err := formatter.Format("", got.String(), formatOpts)
			if err != nil {
				t.Errorf("error formatting compiled libsonnet: %v", err)
			}

			// compare
			verifyLibsonnetFileMatch(t, []byte(formattedLibsonnet))
			// if formattedLibsonnet != tt.want {
			// 	t.Errorf("error compiling jsonschema to libsonnet. got = %v, want %v", formattedLibsonnet, tt.want)
			// }
		})
	}
}
