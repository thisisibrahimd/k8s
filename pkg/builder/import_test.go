package builder

import "testing"

func TestImport(t *testing.T) {
	tests := []struct {
		name string
		n    string
		pkg  string
		ctor func(string, string) ImportType
	}{
		{
			name: "import",
			n:    "m",
			pkg:  "foo.libsonnet",
			ctor: Import,
		},
		{
			name: "importstr",
			n:    "m",
			pkg:  "foo.txt",
			ctor: ImportStr,
		},
		{
			name: "relative path",
			n:    "m",
			pkg:  "../core/main.libsonnet",
			ctor: Import,
		},
		{
			name: "github URL",
			n:    "m",
			pkg:  "github.com/foo/bar/main.libsonnet",
			ctor: Import,
		},
		{
			name: "empty package",
			n:    "m",
			pkg:  "",
			ctor: Import,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			i := tt.ctor(tt.n, tt.pkg)
			o := Object("", Ref(tt.n, i.String()))
			assertRender(t, o)
		})
	}
}
