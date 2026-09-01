package builder

import "testing"

func TestObjectPrimitive(t *testing.T) {
	tests := []struct {
		name     string
		children []Type
	}{
		{
			name: "single int",
			children: []Type{
				Int("count", 42),
			},
		},
		{
			name: "mixed types",
			children: []Type{
				Int("int", 1),
				String("string", "hello"),
				Bool("bool", true),
				Float("float", 23.5),
				Null("null"),
			},
		},
		{
			name: "only strings",
			children: []Type{
				String("name", "app"),
				String("version", "v1.0"),
				String("env", "production"),
			},
		},
		{
			name: "only bools",
			children: []Type{
				Bool("enabled", true),
				Bool("disabled", false),
				Bool("pending", true),
			},
		},
		{
			name:     "empty object",
			children: []Type{},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := Object("", tt.children...)
			assertRender(t, o)
		})
	}
}

func TestObjectFuncs(t *testing.T) {
	tests := []struct {
		name     string
		children []Type
	}{
		{
			name: "regular func with mixed args",
			children: []Type{
				Func("regular",
					Args(
						String("s", "string"),
						Bool("b", false),
						Int("i", 3),
						Float("f", 23.5),
					),
					Object("",
						Ref("s", "s"),
						Ref("b", "b"),
						Ref("i", "i"),
						Ref("f", "f"),
					),
				),
			},
		},
		{
			name: "hidden func with single arg",
			children: []Type{
				Func("hidden",
					Args(Int("h", 3)),
					Ref("h", "h"),
				),
			},
		},
		{
			name: "func with no args",
			children: []Type{
				Func("empty",
					nil,
					String("result", "done"),
				),
			},
		},
		{
			name: "func returning object",
			children: []Type{
				Func("build",
					Args(String("name", "app"), Int("replicas", 3)),
					Object("",
						String("name", "name"),
						Int("count", 3),
					),
				),
			},
		},
		{
			name: "multiple funcs",
			children: []Type{
				Func("create",
					Args(String("name", "")),
					Object("", String("name", "name")),
				),
				Func("delete",
					Args(String("name", "")),
					Ref("found", "name"),
				),
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := Object("", tt.children...)
			assertRender(t, o)
		})
	}
}

func TestObjectMerge(t *testing.T) {
	tests := []struct {
		name     string
		children []Type
	}{
		{
			name: "regular merge",
			children: []Type{
				Merge(Object("regular",
					Int("int", 2),
				)),
			},
		},
		{
			name: "hidden merge",
			children: []Type{
				Hidden(Merge(Object("hidden",
					String("incognito", "yes!"),
				))),
			},
		},
		{
			name: "mixed merge and regular",
			children: []Type{
				Merge(Object("regular",
					Int("int", 2),
				)),
				Hidden(Merge(Object("hidden",
					String("incognito", "yes!"),
				))),
			},
		},
		{
			name: "multiple merges",
			children: []Type{
				Merge(Object("a", Int("x", 1))),
				Merge(Object("b", String("y", "hello"))),
				Merge(Object("c", Bool("z", true))),
			},
		},
		{
			name: "merge with nested object",
			children: []Type{
				Merge(Object("nested",
					Object("inner",
						String("key", "value"),
					),
				)),
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := Object("", tt.children...)
			assertRender(t, o)
		})
	}
}

func TestObjectLocal(t *testing.T) {
	tests := []struct {
		name     string
		children []Type
	}{
		{
			name: "single local",
			children: []Type{
				Local(String("msg", "hello")),
				Ref("greet", "msg"),
			},
		},
		{
			name: "multiple locals",
			children: []Type{
				Local(String("msg", "hello")),
				Ref("greet", "msg"),
				Local(String("sth", "else")),
			},
		},
		{
			name: "local with int",
			children: []Type{
				Local(Int("count", 5)),
				Ref("n", "count"),
			},
		},
		{
			name: "local with bool",
			children: []Type{
				Local(Bool("flag", true)),
				Ref("enabled", "flag"),
			},
		},
		{
			name: "local with object",
			children: []Type{
				Local(Object("config", String("key", "value"))),
				Ref("cfg", "config"),
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := Object("", tt.children...)
			assertRender(t, o)
		})
	}
}

func TestObjectConcise(t *testing.T) {
	tests := []struct {
		name     string
		children []Type
	}{
		{
			name: "single string",
			children: []Type{
				String("s", "string"),
			},
		},
		{
			name: "string and bool",
			children: []Type{
				String("s", "string"),
				Bool("b", false),
			},
		},
		{
			name: "int and float",
			children: []Type{
				Int("n", 42),
				Float("f", 3.14),
			},
		},
		{
			name: "all primitives",
			children: []Type{
				String("s", "val"),
				Int("n", 1),
				Bool("b", true),
				Float("f", 1.5),
				Null("nil"),
			},
		},
		{
			name:     "empty concise",
			children: []Type{},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := ConciseObject(tt.name, tt.children...)
			assertRender(t, o)
		})
	}
}
