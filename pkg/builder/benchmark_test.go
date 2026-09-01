package builder

import "testing"

func BenchmarkObject_Large(b *testing.B) {
	var children []Type
	for i := 0; i < 20; i++ {
		children = append(children, String("field"+string(rune('a'+i%26)), "value"))
	}
	o := Object("large", children...)

	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_ = o.String()
	}
}

func BenchmarkObject_DeepNesting(b *testing.B) {
	o := Object("root")
	for i := 0; i < 10; i++ {
		o = Object("level", Object("inner", o))
	}

	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_ = o.String()
	}
}

func BenchmarkMarshal_Complex(b *testing.B) {
	data := map[string]interface{}{
		"name": "app",
		"spec": map[string]interface{}{
			"containers": []interface{}{
				map[string]interface{}{
					"name":  "web",
					"image": "nginx:latest",
					"ports": []interface{}{
						map[string]interface{}{"containerPort": 80},
						map[string]interface{}{"containerPort": 443},
					},
					"env": []interface{}{
						map[string]interface{}{"name": "ENV", "value": "prod"},
					},
				},
			},
			"replicas": 3,
		},
	}

	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_ = Marshal("root", data)
	}
}

func BenchmarkArgsString_Many(b *testing.B) {
	args := []Type{}
	for i := 0; i < 10; i++ {
		args = append(args, String("arg"+string(rune('a'+i)), "value"))
	}

	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_ = argsString(args, true)
	}
}

func BenchmarkCallChain(b *testing.B) {
	calls := []CallType{}
	for i := 0; i < 5; i++ {
		calls = append(calls, Call("", "method"+string(rune('a'+i)), Args(String("p", "v"))))
	}

	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_ = CallChain("chain", calls...)
	}
}

func BenchmarkDoc_WithLocals(b *testing.B) {
	locals := []LocalType{
		Local(String("name", "app")),
		Local(Int("replicas", 3)),
		Local(Object("config", String("key", "value"))),
	}
	doc := Doc{
		Locals: locals,
		Root:   Object("deploy", String("name", "name"), Int("replicas", 3)),
	}

	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_ = doc.String()
	}
}

func BenchmarkEscapeKey(b *testing.B) {
	inputs := []string{
		"foo",
		"function",
		"my-key",
		"api.version",
		"v1",
	}

	b.ReportAllocs()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for _, s := range inputs {
			_ = escapeKey(s)
		}
	}
}
