package builder

import "fmt"

// ImportType represents a Jsonnet import or importstr expression.
//
// When raw is false, String produces (import 'pkg'), which evaluates
// the imported file as Jsonnet. When raw is true, it produces (importstr 'pkg'),
// which imports the file content as a raw string.
type ImportType struct {
	named
	pkg string
	raw bool
}

// String renders the import expression, e.g. (import 'foo.libsonnet')
// or (importstr 'foo.txt').
func (i ImportType) String() string {
	op := "import"
	if i.raw {
		op += "str"
	}

	return fmt.Sprintf(`(%s '%s')`, op, i.pkg)
}

// Import creates an import expression that evaluates the imported file as Jsonnet.
func Import(name, pkg string) ImportType {
	return ImportType{named: named(name), pkg: pkg, raw: false}
}

// ImportStr creates an importstr expression that imports the file content as a raw string.
func ImportStr(name, pkg string) ImportType {
	return ImportType{named: named(name), pkg: pkg, raw: true}
}
