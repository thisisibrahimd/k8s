package builder

import (
	"testing"
)

func TestMarshalTypeMapping(t *testing.T) {
	tests := []struct {
		name    string
		input   interface{}
		checkFn func(*testing.T, Type)
	}{
		{
			name:  "int",
			input: 42,
			checkFn: func(t *testing.T, got Type) {
				v, ok := got.(IntType)
				if !ok {
					t.Fatalf("got %T, want IntType", got)
				}
				if v.value != 42 {
					t.Errorf("IntType.value = %d, want 42", v.value)
				}
			},
		},
		{
			name:  "float64 truncates to int",
			input: float64(3.14),
			checkFn: func(t *testing.T, got Type) {
				v, ok := got.(IntType)
				if !ok {
					t.Fatalf("got %T, want IntType", got)
				}
				if v.value != 3 {
					t.Errorf("IntType.value = %d, want 3 (truncated)", v.value)
				}
			},
		},
		{
			name:  "string",
			input: "hello",
			checkFn: func(t *testing.T, got Type) {
				v, ok := got.(StringType)
				if !ok {
					t.Fatalf("got %T, want StringType", got)
				}
				if v.value != "hello" {
					t.Errorf("StringType.value = %q, want %q", v.value, "hello")
				}
			},
		},
		{
			name:  "bool true",
			input: true,
			checkFn: func(t *testing.T, got Type) {
				v, ok := got.(BoolType)
				if !ok {
					t.Fatalf("got %T, want BoolType", got)
				}
				if !v.value {
					t.Errorf("BoolType.value = %v, want true", v.value)
				}
			},
		},
		{
			name:  "bool false",
			input: false,
			checkFn: func(t *testing.T, got Type) {
				v, ok := got.(BoolType)
				if !ok {
					t.Fatalf("got %T, want BoolType", got)
				}
				if v.value {
					t.Errorf("BoolType.value = %v, want false", v.value)
				}
			},
		},
		{
			name:  "nil",
			input: nil,
			checkFn: func(t *testing.T, got Type) {
				_, ok := got.(NullType)
				if !ok {
					t.Fatalf("got %T, want NullType", got)
				}
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := marshal(tt.name, tt.input)
			tt.checkFn(t, got)
		})
	}
}

func TestMarshalMap(t *testing.T) {
	got := marshal("obj", map[string]interface{}{
		"name":  "test",
		"count": float64(5),
	})

	obj, ok := got.(ObjectType)
	if !ok {
		t.Fatalf("got %T, want ObjectType", got)
	}
	if len(obj.children) != 2 {
		t.Errorf("Object children = %d, want 2", len(obj.children))
	}

	// Check that keys are escaped correctly
	if _, hasName := obj.children["name"]; !hasName {
		t.Error("missing 'name' key")
	}
	if _, hasCount := obj.children["count"]; !hasCount {
		t.Error("missing 'count' key")
	}
}

func TestMarshalEmptyMap(t *testing.T) {
	got := marshal("empty", map[string]interface{}{})

	obj, ok := got.(ObjectType)
	if !ok {
		t.Fatalf("got %T, want ObjectType", got)
	}
	if len(obj.children) != 0 {
		t.Errorf("Object children = %d, want 0", len(obj.children))
	}
	if s := obj.String(); s != "{}" {
		t.Errorf("Object.String() = %q, want {}", s)
	}
}

func TestMarshalSlice(t *testing.T) {
	got := marshal("items", []interface{}{
		float64(1),
		"hello",
		true,
	})

	list, ok := got.(ListType)
	if !ok {
		t.Fatalf("got %T, want ListType", got)
	}
	if len(list.items) != 3 {
		t.Fatalf("List items = %d, want 3", len(list.items))
	}

	if _, ok := list.items[0].(IntType); !ok {
		t.Errorf("items[0] = %T, want IntType", list.items[0])
	}
	if _, ok := list.items[1].(StringType); !ok {
		t.Errorf("items[1] = %T, want StringType", list.items[1])
	}
	if _, ok := list.items[2].(BoolType); !ok {
		t.Errorf("items[2] = %T, want BoolType", list.items[2])
	}
}

func TestMarshalEmptySlice(t *testing.T) {
	got := marshal("empty", []interface{}{})

	list, ok := got.(ListType)
	if !ok {
		t.Fatalf("got %T, want ListType", got)
	}
	if len(list.items) != 0 {
		t.Errorf("List items = %d, want 0", len(list.items))
	}
	if s := list.String(); s != "[]" {
		t.Errorf("List.String() = %q, want []", s)
	}
}

func TestMarshalNested(t *testing.T) {
	got := marshal("root", map[string]interface{}{
		"spec": map[string]interface{}{
			"containers": []interface{}{
				map[string]interface{}{
					"name":  "app",
					"image": "myapp:v1",
				},
			},
		},
	})

	obj, ok := got.(ObjectType)
	if !ok {
		t.Fatalf("got %T, want ObjectType", got)
	}

	spec, ok := obj.children["spec"].(ObjectType)
	if !ok {
		t.Fatalf("spec = %T, want ObjectType", obj.children["spec"])
	}

	containers, ok := spec.children["containers"].(ListType)
	if !ok {
		t.Fatalf("containers = %T, want ListType", spec.children["containers"])
	}
	if len(containers.items) != 1 {
		t.Fatalf("containers items = %d, want 1", len(containers.items))
	}

	container, ok := containers.items[0].(ObjectType)
	if !ok {
		t.Fatalf("container[0] = %T, want ObjectType", containers.items[0])
	}
	if len(container.children) != 2 {
		t.Errorf("container children = %d, want 2", len(container.children))
	}
}

func TestMarshal_Panics(t *testing.T) {
	tests := []struct {
		name    string
		fn      func()
		wantMsg string
	}{
		{
			name:    "unsupported complex64",
			fn:      func() { marshal("x", complex64(1+2i)) },
			wantMsg: "unsupported type: complex64",
		},
		{
			name:    "unsupported complex128",
			fn:      func() { marshal("x", complex128(1+2i)) },
			wantMsg: "unsupported type: complex128",
		},
		{
			name:    "non-object string",
			fn:      func() { Marshal("x", "hello") },
			wantMsg: "cannot unmarshal",
		},
		{
			name:    "non-object number",
			fn:      func() { Marshal("x", 42) },
			wantMsg: "cannot unmarshal",
		},
		{
			name:    "non-object array",
			fn:      func() { Marshal("x", []int{1, 2, 3}) },
			wantMsg: "cannot unmarshal",
		},
	}

	for _, tt := range tests {
		assertPanics(t, tt.name, tt.fn, tt.wantMsg)
	}
}

func TestMarshal_PublicAPI(t *testing.T) {
	type Config struct {
		Name    string `json:"name"`
		Enabled bool   `json:"enabled"`
		Count   int    `json:"count"`
	}

	got := Marshal("cfg", Config{
		Name:    "test",
		Enabled: true,
		Count:   5,
	})

	obj, ok := got.(ObjectType)
	if !ok {
		t.Fatalf("got %T, want ObjectType", got)
	}
	if len(obj.children) != 3 {
		t.Fatalf("Object children = %d, want 3", len(obj.children))
	}

	nameVal, ok := obj.children["name"].(StringType)
	if !ok {
		t.Errorf("children['name'] = %T, want StringType", obj.children["name"])
	} else if nameVal.value != "test" {
		t.Errorf("children['name'].value = %q, want %q", nameVal.value, "test")
	}

	enabledVal, ok := obj.children["enabled"].(BoolType)
	if !ok {
		t.Errorf("children['enabled'] = %T, want BoolType", obj.children["enabled"])
	} else if !enabledVal.value {
		t.Errorf("children['enabled'].value = %v, want true", enabledVal.value)
	}

	countVal, ok := obj.children["count"].(IntType)
	if !ok {
		t.Errorf("children['count'] = %T, want IntType", obj.children["count"])
	} else if countVal.value != 5 {
		t.Errorf("children['count'].value = %d, want 5", countVal.value)
	}
}

func TestMarshal_NilInSlice(t *testing.T) {
	got := marshal("items", []interface{}{float64(1), nil, "x"})

	list, ok := got.(ListType)
	if !ok {
		t.Fatalf("got %T, want ListType", got)
	}
	if len(list.items) != 3 {
		t.Fatalf("List items = %d, want 3", len(list.items))
	}
	if _, ok := list.items[1].(NullType); !ok {
		t.Errorf("items[1] = %T, want NullType", list.items[1])
	}
}
