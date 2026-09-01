package builder

import "testing"

func TestDoc(t *testing.T) {
	tests := []struct {
		name   string
		locals []LocalType
		root   Type
	}{
		{
			name:   "no locals",
			locals: nil,
			root:   Object("simple", String("key", "value")),
		},
		{
			name: "single local",
			locals: []LocalType{
				Local(String("msg", "hello")),
			},
			root: Ref("greeting", "msg"),
		},
		{
			name: "multiple locals",
			locals: []LocalType{
				Local(String("name", "app")),
				Local(Int("replicas", 3)),
			},
			root: Object("deploy",
				String("name", "name"),
				Int("replicas", 3),
			),
		},
		{
			name: "local with object value",
			locals: []LocalType{
				Local(Object("config",
					String("host", "localhost"),
					Int("port", 8080),
				)),
			},
			root: Ref("cfg", "config"),
		},
		{
			name: "local with import",
			locals: []LocalType{
				Local(Import("lib", "foo.libsonnet")),
			},
			root: Call("init", "lib.new", Args(String("name", "app"))),
		},
		{
			name: "local with func",
			locals: []LocalType{
				Local(Func("build",
					Args(String("name", "")),
					Object("", String("name", "name")),
				)),
			},
			root: Call("result", "build", Args(String("name", "myapp"))),
		},
		{
			name: "local with list",
			locals: []LocalType{
				Local(List("items", Int("", 1), Int("", 2), Int("", 3))),
			},
			root: Ref("nums", "items"),
		},
		{
			name: "empty root",
			locals: []LocalType{
				Local(String("unused", "value")),
			},
			root: Object("empty"),
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			doc := Doc{
				Locals: tt.locals,
				Root:   tt.root,
			}
			assertRenderBytes(t, doc.String())
		})
	}
}
