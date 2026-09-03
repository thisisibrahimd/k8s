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
			name: "testimport-import",
			n:    "m",
			pkg:  "foo.libsonnet",
			ctor: Import,
		},
		{
			name: "testimport-importstr",
			n:    "m",
			pkg:  "foo.txt",
			ctor: ImportStr,
		},
		{
			name: "testimport-relative path",
			n:    "m",
			pkg:  "../core/main.libsonnet",
			ctor: Import,
		},
		{
			name: "testimport-github URL",
			n:    "m",
			pkg:  "github.com/foo/bar/main.libsonnet",
			ctor: Import,
		},
		{
			name: "testimport-empty package",
			n:    "m",
			pkg:  "",
			ctor: Import,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			i := tt.ctor(tt.n, tt.pkg)
			o := Object("", Ref(tt.n, i.String()))
			assertRender(t, tt.name, o)
		})
	}
}
