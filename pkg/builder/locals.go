package builder

// LocalType represents a local binding within an [Object].
//
// Renders as "local name = value". String and Name delegate to the wrapped type.
type LocalType struct {
	value Type
}

// Local creates a local binding inside an [Object].
func Local(value Type) LocalType {
	return LocalType{value}
}

// String renders the wrapped type's string representation.
func (t LocalType) String() string {
	return t.value.String()
}

// Name returns the wrapped type's name.
func (t LocalType) Name() string {
	return t.value.Name()
}
