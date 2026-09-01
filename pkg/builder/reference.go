package builder

// RefType represents a reference to another value in Jsonnet.
//
// String returns the target identifier verbatim — no quoting, no transformation.
type RefType struct {
	named
	to string
}

// Ref creates a reference to the identifier given by to.
//
// The to string is emitted as-is in the generated Jsonnet output,
// so it should be a valid Jsonnet expression (e.g., "x", "self.foo", "super.bar").
func Ref(name, to string) RefType {
	return RefType{named(name), to}
}

// String returns the target identifier verbatim.
func (r RefType) String() string {
	return r.to
}
