package builder

import (
	"fmt"
	"strings"
	"testing"

	"github.com/google/go-jsonnet/formatter"
	"github.com/sebdah/goldie/v2"
)

// assertRender verifies that the rendered Type matches the golden file.
// Golden files are stored in ./testdata/<TestName>/<subtest-name>.golden.libsonnet.
// The rendered output is also validated as syntactically valid Jsonnet.
func assertRender(t *testing.T, o Type) {
	t.Helper()
	output := Doc{Root: o}.String()
	assertValidJsonnet(t, output)

	g := goldie.New(t,
		goldie.WithFixtureDir("./testdata"),
		goldie.WithNameSuffix(".golden.libsonnet"),
		goldie.WithTestNameForDir(false),
		goldie.WithSubTestNameForDir(false),
	)
	g.Assert(t, t.Name(), []byte(output))
}

// assertValidJsonnet verifies that output is syntactically valid Jsonnet
// by running it through the go-jsonnet formatter, which parses before formatting.
func assertValidJsonnet(t *testing.T, output string) {
	t.Helper()
	_, err := formatter.Format("", output, formatter.DefaultOptions())
	if err != nil {
		t.Errorf("rendered output is not valid Jsonnet: %v\noutput:\n%s", err, output)
	}
}

// assertPanics verifies that fn panics and optionally checks the panic message.
func assertPanics(t *testing.T, name string, fn func(), wantMsg string) {
	t.Helper()
	t.Run(name, func(t *testing.T) {
		defer func() {
			r := recover()
			if r == nil {
				t.Fatal("expected panic, but did not panic")
			}
			if wantMsg != "" {
				msg := fmt.Sprintf("%v", r)
				if !strings.Contains(msg, wantMsg) {
					t.Errorf("panic message = %q, want to contain %q", msg, wantMsg)
				}
			}
		}()
		fn()
	})
}

// assertRenderBytes verifies that output matches the golden file.
// Use when rendering is not via Doc{Root: Type}, e.g. Doc with Locals.
// Output is validated as syntactically valid Jsonnet.
func assertRenderBytes(t *testing.T, output string) {
	t.Helper()
	assertValidJsonnet(t, output)

	g := goldie.New(t,
		goldie.WithFixtureDir("./testdata"),
		goldie.WithNameSuffix(".golden.libsonnet"),
		goldie.WithTestNameForDir(false),
		goldie.WithSubTestNameForDir(false),
	)
	g.Assert(t, t.Name(), []byte(output))
}
