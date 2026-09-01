package builder

import (
	"encoding/json"
	"fmt"
)

// Marshal converts any Go value to a builder [Type] tree.
//
// It first JSON-marshals the value (stripping custom types), then recursively
// maps JSON types to builder types: numbers to [IntType], strings to [StringType],
// booleans to [BoolType], objects to [ObjectType], arrays to [ListType], null to [NullType].
//
// Panics if the value cannot be JSON-marshaled or if the result is not a JSON object.
func Marshal(name string, ptr interface{}) Type {
	// get rid of custom types, but retain metadata (json)
	jsonData, err := json.Marshal(ptr)
	if err != nil {
		panic(err)
	}

	var data map[string]interface{}
	if err := json.Unmarshal(jsonData, &data); err != nil {
		panic(err)
	}

	return marshal(name, data)
}

// marshal recursively maps a Go value to a builder [Type].
//
// JSON numbers (always float64) are truncated to int. Unsupported types panic.
func marshal(name string, ptr interface{}) Type {
	switch t := ptr.(type) {
	case int:
		return Int(name, t)
	case float64:
		return Int(name, int(t))
	case string:
		return String(name, t)
	case bool:
		return Bool(name, t)
	case map[string]interface{}:
		childs := []Type{}
		for k, v := range t {
			childs = append(childs, marshal(k, v))
		}
		return Object(name, childs...)
	case []interface{}:
		childs := []Type{}
		for _, v := range t {
			childs = append(childs, marshal("", v))
		}
		return List(name, childs...)
	case nil:
		return Null(name)
	default:
		panic(fmt.Sprintf("unsupported type: %T", ptr))
	}
}
