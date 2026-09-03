package integration

// TestMapHelper verifies the map helpers (mapXyz, mapXyzByName) work correctly.
//
// Note: Nested map usage (calling mapXyz inside a mapXyz transform) is not supported.
// The mapXyz helpers use `super` which only works in object merge contexts. Inside a
// std.map callback, `super` is not available, so chaining map helpers like:
//
//   mod.mapContainers(function(c) c {
//     ports: mod.mapPorts(function(p) ..., super.ports)  // ERROR: super not available
//   })
//
// will fail. Instead, use `std.map` directly for nested arrays:
//
//   mod.mapContainers(function(c) c {
//     ports: std.map(function(p) p{port: 8080}, super.ports)  // OK: super in merge context
//   })

import (
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/google/go-jsonnet"
	"github.com/google/go-jsonnet/formatter"
	"github.com/sebdah/goldie/v2"
)

func TestMapHelper(t *testing.T) {
	tests := []struct {
		name     string
		modFile  string
		baseFile string
	}{
		{
			name:     "simple_array",
			modFile:  "simple_array.modifier.libsonnet",
			baseFile: "simple_array.base.libsonnet",
		},
		{
			name:     "nested_path",
			modFile:  "nested_path.modifier.libsonnet",
			baseFile: "nested_path.base.libsonnet",
		},
		{
			name:     "by_name",
			modFile:  "by_name.modifier.libsonnet",
			baseFile: "by_name.base.libsonnet",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			basePath := filepath.Join("testdata", tt.baseFile)
			snippet, err := os.ReadFile(basePath)
			if err != nil {
				t.Fatalf("failed to read base: %v", err)
			}

			vm := jsonnet.MakeVM()
			output, err := vm.EvaluateFile(basePath)
			if err != nil {
				t.Fatalf("jsonnet evaluation failed: %v\nsnippet:\n%s", err, string(snippet))
			}

			formatted, err := formatter.Format(tt.name+".libsonnet", output, formatter.DefaultOptions())
			if err != nil {
				t.Fatalf("format failed: %v\noutput: %s", err, output)
			}

			g := goldie.New(t,
				goldie.WithFixtureDir("./testdata"),
				goldie.WithNameSuffix(".golden.libsonnet"),
				goldie.WithTestNameForDir(false),
				goldie.WithSubTestNameForDir(false),
			)
			g.Assert(t, strings.ReplaceAll(tt.name, " ", "_"), []byte(formatted))
		})
	}
}
