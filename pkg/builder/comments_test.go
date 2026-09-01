package builder

import "testing"

func TestCommentType_Comment(t *testing.T) {
	tests := []struct {
		name    string
		comment string
		child   Type
	}{
		{
			name:    "single line",
			comment: "hello",
			child:   String("x", "1"),
		},
		{
			name:    "multi line",
			comment: "hello\nworld",
			child:   String("x", "1"),
		},
		{
			name:    "empty string",
			comment: "",
			child:   String("x", "1"),
		},
		{
			name:    "trailing newline",
			comment: "hello\n",
			child:   Int("n", 42),
		},
		{
			name:    "blank lines in between",
			comment: "a\n\nb",
			child:   Bool("flag", true),
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			ct := Comment(tt.child, tt.comment)
			o := Object("", ct)
			assertRender(t, o)
		})
	}
}

func TestCommentType_Rendering(t *testing.T) {
	tests := []struct {
		name     string
		children []Type
	}{
		{
			name: "comment on string",
			children: []Type{
				Comment(String("name", "app"), "The application name"),
			},
		},
		{
			name: "comment on int",
			children: []Type{
				Comment(Int("replicas", 3), "Number of replicas"),
			},
		},
		{
			name: "comment on object",
			children: []Type{
				Comment(Object("spec",
					String("image", "nginx"),
					Int("port", 80),
				), "Container specification"),
			},
		},
		{
			name: "comment on func",
			children: []Type{
				Comment(
					Func("build",
						Args(String("name", "")),
						Object("", String("name", "name")),
					),
					"Builds a new object",
				),
			},
		},
		{
			name: "comment on bool",
			children: []Type{
				Comment(Bool("enabled", true), "Whether the feature is enabled"),
			},
		},
		{
			name: "comment on ref",
			children: []Type{
				Comment(Ref("config", "self.config"), "Reference to config"),
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

func TestRequiredArgType(t *testing.T) {
	tests := []struct {
		name  string
		child Type
	}{
		{
			name:  "required string",
			child: Required(String("name", "")),
		},
		{
			name:  "required int",
			child: Required(Int("count", 0)),
		},
		{
			name:  "required bool",
			child: Required(Bool("enabled", false)),
		},
		{
			name:  "required float",
			child: Required(Float("rate", 0.0)),
		},
		{
			name:  "required ref",
			child: Required(Ref("config", "self.cfg")),
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := Object("", Func("fn", Args(tt.child), Ref("result", "name")))
			assertRender(t, o)
		})
	}
}

func TestCallArg(t *testing.T) {
	tests := []struct {
		name  string
		child Type
	}{
		{
			name:  "call with string arg",
			child: Call("result", "format", Args(CallArgFrom(String("msg", "hello")))),
		},
		{
			name:  "call with int arg",
			child: Call("result", "add", Args(CallArgFrom(Int("n", 5)))),
		},
		{
			name:  "call with bool arg",
			child: Call("result", "check", Args(CallArgFrom(Bool("flag", true)))),
		},
		{
			name:  "call with ref arg",
			child: Call("result", "use", Args(CallArgFrom(Ref("val", "self.value")))),
		},
		{
			name:  "call with object arg",
			child: Call("result", "apply", Args(CallArgFrom(Object("cfg", String("key", "value"))))),
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := Object("", tt.child)
			assertRender(t, o)
		})
	}
}
