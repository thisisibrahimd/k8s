package builder

import (
	"fmt"
	"testing"
)

func TestLargeFunc(t *testing.T) {
	tests := []struct {
		name     string
		funcName string
		hidden   bool
		args     []Type
		children []Type
	}{
		{
			name:     "basic large func",
			funcName: "large",
			hidden:   true,
			args: Args(
				String("string", "string"),
				Bool("bool", true),
				Int("number", 5),
				ConciseObject("map", String("foo", "bar")),
			),
			children: []Type{
				Ref("m", "map"),
				Ref("b", "bool"),
				Ref("s", "string"),
				Ref("n", "number"),
			},
		},
		{
			name:     "func with single arg",
			funcName: "simple",
			hidden:   false,
			args: Args(
				String("name", "app"),
			),
			children: []Type{
				String("name", "name"),
			},
		},
		{
			name:     "func with nested object",
			funcName: "complex",
			hidden:   true,
			args: Args(
				String("name", "app"),
				Int("replicas", 3),
			),
			children: []Type{
				Object("spec",
					String("name", "name"),
					Int("count", 3),
				),
			},
		},
		{
			name:     "func with no args",
			funcName: "empty",
			hidden:   false,
			args:     nil,
			children: []Type{
				String("result", "done"),
			},
		},
		{
			name:     "func with many args",
			funcName: "deploy",
			hidden:   true,
			args: Args(
				String("image", "nginx:latest"),
				Int("port", 80),
				Bool("tls", true),
				String("host", "example.com"),
			),
			children: []Type{
				String("image", "image"),
				Int("port", 80),
				Bool("tls", true),
				String("host", "host"),
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			var o Type
			if tt.hidden {
				o = Object("",
					Hidden(LargeFunc(tt.funcName, tt.args, Object("", tt.children...))),
				)
			} else {
				o = Object("",
					LargeFunc(tt.funcName, tt.args, Object("", tt.children...)),
				)
			}
			assertRender(t, tt.name, o)
		})
	}
}

func TestArgsString(t *testing.T) {
	tests := []struct {
		name      string
		args      []Type
		breakLine bool
		want      string
	}{
		{
			name:      "single default arg",
			args:      []Type{String("s", "hello")},
			breakLine: false,
			want:      `s="hello"`,
		},
		{
			name:      "multiple default args",
			args:      []Type{String("s", "hello"), Int("n", 5)},
			breakLine: false,
			want:      `s="hello", n=5`,
		},
		{
			name:      "required arg (no default)",
			args:      []Type{Required(String("s", ""))},
			breakLine: false,
			want:      "s",
		},
		{
			name:      "call arg (positional)",
			args:      []Type{CallArgFrom(String("s", "hello"))},
			breakLine: false,
			want:      `"hello"`,
		},
		{
			name:      "mixed required and default",
			args:      []Type{Required(String("name", "")), Int("count", 1)},
			breakLine: false,
			want:      "name, count=1",
		},
		{
			name:      "empty args",
			args:      []Type{},
			breakLine: false,
			want:      "",
		},
		{
			name: "testargsstring-break line single",
			args: []Type{
				String("s", "hello"),
			},
			breakLine: true,
			want:      "\n  s=\"hello\"",
		},
		{
			name: "testargsstring-break line multiple",
			args: []Type{
				String("s", "hello"),
				Int("n", 5),
				Bool("b", true),
			},
			breakLine: true,
			want:      "\n  s=\"hello\",\n  n=5,\n  b=true",
		},
		{
			name: "testargsstring-break line with required",
			args: []Type{
				Required(String("name", "")),
				Int("count", 1),
			},
			breakLine: true,
			want:      "\n  name,\n  count=1",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := argsString(tt.args, tt.breakLine)
			if got != tt.want {
				t.Errorf("argsString(%d args, breakLine=%v) = %q, want %q", len(tt.args), tt.breakLine, got, tt.want)
			}
		})
	}
}

func Example_indent() {
	s := indent("hello\nworld")
	fmt.Println(s)
	// Output:
	//   hello
	//   world
}

func Example_dedent() {
	s := dedent("  hello\n  world")
	fmt.Println(s)
	// Output:
	// hello
	// world
}
