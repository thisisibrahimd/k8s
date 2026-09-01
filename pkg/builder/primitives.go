package builder

import (
	"encoding/json"
	"fmt"
	"strconv"
)

// StringType represents a Jsonnet string literal.
//
// String renders the value as a JSON-quoted string.
type StringType struct {
	named
	value string
}

// String creates a Jsonnet string literal.
func String(name, value string) StringType {
	return StringType{named: named(name), value: value}
}

// SafeString returns a StringType whose identifier is safe for use as a Jsonnet
// parameter name. Reserved keywords are renamed by appending an underscore.
func SafeString(name, value string) StringType {
	return StringType{named: named(SafeIdentifier(name)), value: value}
}

// String renders the value as a JSON-quoted string.
func (s StringType) String() string {
	data, err := json.Marshal(s.value)
	if err != nil {
		panic(err)
	}
	return string(data)
}

// FloatType represents a Jsonnet floating-point number.
//
// String renders the value with %f formatting (6 decimal places).
type FloatType struct {
	named
	value float64
}

// Float creates a Jsonnet float literal.
func Float(name string, value float64) FloatType {
	return FloatType{named: named(name), value: value}
}

// String renders the value with %f formatting.
func (f FloatType) String() string {
	return fmt.Sprintf("%f", f.value)
}

// IntType represents a Jsonnet integer literal.
type IntType struct {
	named
	value int
}

// Int creates a Jsonnet integer literal.
func Int(name string, value int) IntType {
	return IntType{named: named(name), value: value}
}

// String renders the integer as a decimal string.
func (s IntType) String() string {
	return strconv.Itoa(s.value)
}

// BoolType represents a Jsonnet boolean literal.
type BoolType struct {
	named
	value bool
}

// Bool creates a Jsonnet boolean literal.
func Bool(name string, value bool) BoolType {
	return BoolType{named: named(name), value: value}
}

// String renders "true" or "false".
func (s BoolType) String() string {
	return fmt.Sprintf(`%v`, s.value)
}

// NullType represents a Jsonnet null literal.
type NullType struct {
	named
}

// Null creates a Jsonnet null literal.
func Null(name string) NullType {
	return NullType{named: named(name)}
}

// String renders "null".
func (s NullType) String() string {
	return "null"
}
