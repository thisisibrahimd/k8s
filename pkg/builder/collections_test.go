package builder

import "testing"

func TestList(t *testing.T) {
	tests := []struct {
		name     string
		n        string
		items    []Type
		wantName string
	}{
		{
			name:     "empty",
			n:        "a",
			items:    []Type{},
			wantName: "a",
		},
		{
			name:     "single",
			n:        "a",
			items:    []Type{String("", "hello")},
			wantName: "a",
		},
		{
			name:     "multiple",
			n:        "items",
			items:    []Type{Int("", 1), Int("", 2), Int("", 3)},
			wantName: "items",
		},
		{
			name:     "mixed types",
			n:        "a",
			items:    []Type{String("", "x"), Int("", 1), Bool("", true)},
			wantName: "a",
		},
		{
			name:     "nested object",
			n:        "a",
			items:    []Type{ConciseObject("", String("k", "v"))},
			wantName: "a",
		},
		{
			name:     "nested list",
			n:        "a",
			items:    []Type{List("", Int("", 1))},
			wantName: "a",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			l := List(tt.n, tt.items...)
			if got := l.Name(); got != tt.wantName {
				t.Errorf("List(%q, ...).Name() = %q, want %q", tt.n, got, tt.wantName)
			}
			o := Object("", l)
			assertRender(t, tt.name, o)
		})
	}
}

func TestArrayComprehension(t *testing.T) {
	tests := []struct {
		name string
		c    ArrayComprehensionType
	}{
		{
			name: "testarraycomprehension-basic",
			c: ArrayComprehension("x", "c", "name",
				Ref("", "super.containers"),
				Ref("", "name"),
				Ref("", "c"),
			),
		},
		{
			name: "testarraycomprehension-simple match value",
			c: ArrayComprehension("x", "c", "name",
				Ref("", "super.x"),
				String("", "foo"),
				Ref("", "c"),
			),
		},
		{
			name: "testarraycomprehension-nested source",
			c: ArrayComprehension("x", "c", "name",
				Ref("", "super.spec.containers"),
				Ref("", "name"),
				Ref("", "c"),
			),
		},
		{
			name: "testarraycomprehension-different field",
			c: ArrayComprehension("x", "item", "key",
				Ref("", "super.y"),
				Ref("", "target"),
				Ref("", "item"),
			),
		},
		{
			name: "testarraycomprehension-with int match",
			c: ArrayComprehension("x", "c", "name",
				Ref("", "super.x"),
				Int("", 5),
				Ref("", "c"),
			),
		},
		{
			name: "testarraycomprehension-real world modifiers pattern",
			c: ArrayComprehension("containers", "c", "name",
				Ref("", "super.containers"),
				Ref("", "name"),
				Call("", "transformFunc", Args(CallArgFrom(Ref("", "c")))),
			),
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := Object("", Ref("result", tt.c.String()))
			assertRender(t, tt.name, o)
		})
	}
}
