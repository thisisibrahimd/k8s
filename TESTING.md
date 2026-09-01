# Testing Guide

## Running Tests

```bash
# All tests
go test ./...

# Specific package
go test ./pkg/swagger/...

# With coverage
go test ./... -cover -coverprofile=coverage.out
go tool cover -html=coverage.out

# Verbose output
go test ./... -v

# Run single test
go test ./pkg/swagger/... -run TestSwaggerLoader_ResolvesRefs

# Run single subtest
go test ./pkg/swagger/... -run TestSwaggerLoader_ResolvesRefs/direct_ref

# Skip integration tests (faster)
go test -short ./...
```

## Golden Tests

Golden tests compare rendered output against fixture files. All generated Jsonnet is validated via `formatter.Format()` to ensure syntax correctness.

### Directory Structure

```
pkg/builder/testdata/
└── TestName/
    └── subtest-name.golden.libsonnet

pkg/swagger/testdata/
├── golden-k8s-1.35/
│   ├── gen.libsonnet
│   ├── main.libsonnet
│   └── _gen/
│       ├── core/
│       │   └── v1/
│       │       └── pod.libsonnet
│       └── apps/
│           └── v1/
│               └── deployment.libsonnet
└── TestCompileLibsonnet/
    └── simple-schema.golden.libsonnet
```

### Updating Golden Fixtures

```bash
# Regenerate all golden files
make update-golden-test-data

# Regenerate for a specific package
go test ./pkg/swagger/... -update

# Regenerate for a specific test
go test ./pkg/swagger/... -run TestCompileLibsonnet -update
```

### Writing Golden Tests

```go
func TestMyType(t *testing.T) {
    tests := []struct {
        name string
        // ... test fields
    }{
        // ... cases
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            o := Object("", /* ... */)
            assertRender(t, o)  // auto-validates via formatter
        })
    }
}
```

The `assertRender` helper:
1. Renders the Type via `Doc{Root: o}.String()`
2. Compares against golden file
3. Validates output is syntactically valid Jsonnet via `format.Format()`

## Integration Test

`TestK8sSwagger_FullPipeline` validates the entire generation pipeline end-to-end.

### What it does
1. Loads cached k8s swagger spec (~4MB)
2. Runs through `swagger.Load()` → `model.Load()` → `render.Group()`
3. Compares all 685 generated `.libsonnet` files against golden fixtures
4. Validates every file parses as valid Jsonnet

### Adding new versions

Append to `k8sTestCases` in `pkg/integration/integration_test.go`:

```go
var k8sTestCases = []k8sTestCase{
    {
        version: "1.35",
        swagger: "k8s-swagger-1.35.json",
        prefix:  "^io\\.k8s\\.(api|(kube-aggregator|apimachinery)\\.pkg\\.apis)\\..*",
    },
    {
        version: "1.34",
        swagger: "k8s-swagger-1.34.json",     // download and add to testdata/
        prefix:  "^io\\.k8s\\.(api|(kube-aggregator|apimachinery)\\.pkg\\.apis)\\..*",
    },
}
```

Then regenerate golden files:

```bash
go test ./pkg/integration/... -update
```

### Running

```bash
# Run integration test
go test ./pkg/integration/... -v

# Skip (uses -short)
go test -short ./pkg/integration/...
```

## Test Debugging

### `formatDebug()` helper

When Jsonnet formatting fails, `formatDebug()` dumps the raw (unformatted) content for inspection:

```
_gen/resource/v1beta1/resourceClaim.libsonnet: 6:1050-1058 Expected token IDENTIFIER but got "function"
raw content dumped to: pkg/swagger/testdata/debug/resourceClaim.libsonnet
```

Used in:
- `pkg/integration/integration_test.go` — integration test failures
- `pkg/builder/utils_test.go` — builder test failures
- `pkg/compiler/jsonschemacompiler/jsonschemacompiler_test.go` — compiler test failures

Debug files are written to `pkg/swagger/testdata/debug/` and should be cleaned up after investigation.

## Test Structure

| Package | Files | Tests | Purpose |
|---------|-------|-------|---------|
| `pkg/builder/` | `*_test.go`, `fuzz_test.go`, `benchmark_test.go` | Unit + fuzz + benchmarks | Jsonnet AST builder |
| `pkg/render/` | `superref_test.go`, `sort_test.go` | 24 unit tests | Render modifiers |
| `pkg/swagger/` | 4 test files + fixtures | 34 unit tests | Swagger/CRD parsing |
| `pkg/integration/` | `integration_test.go` | 1 integration | Full pipeline + golden |
| `pkg/compiler/` | `*_test.go` | Unit + golden | JSON Schema compiler |

## Fuzz Tests

Fuzz tests find edge cases via randomized input:

```bash
# Run fuzz for 30 seconds
go test ./pkg/builder/... -fuzz=FuzzEscapeKey -fuzztime=30s

# Run fuzz with corpus
go test ./pkg/builder/... -fuzz=FuzzMarshal
```

New corpus entries are saved to `testdata/fuzz/<TestName>/`.

## Benchmarks

```bash
# Run all benchmarks
go test ./pkg/builder/... -bench=. -benchmem

# Run specific benchmark
go test ./pkg/builder/... -bench=BenchmarkObject_Large -benchmem

# Generate CPU profile
go test ./pkg/builder/... -bench=. -cpuprofile=cpu.prof
go tool pprof cpu.prof
```

### Current Benchmarks

| Benchmark | Ops/sec | ns/op | B/op | allocs/op |
|---|---|---|---|---|
| `BenchmarkObject_Large` | ~180K | 6,699 | 7,430 | 183 |
| `BenchmarkObject_DeepNesting` | ~43K | 27,651 | 41,599 | 559 |
| `BenchmarkMarshal_Complex` | ~171K | 6,823 | 6,891 | 125 |
| `BenchmarkArgsString_Many` | ~549K | 2,191 | 1,833 | 70 |
| `BenchmarkCallChain` | ~595K | 2,035 | 1,385 | 61 |
| `BenchmarkDoc_WithLocals` | ~835K | 1,441 | 984 | 44 |
| `BenchmarkEscapeKey` | ~4.9M | 243 | 88 | 6 |

## Conventions

1. **Table-driven**: All tests use table-driven format
2. **Golden files**: Type rendering tests use golden fixtures, not inline strings
3. **Validation**: All golden outputs validated as syntactically valid Jsonnet
4. **Panic tests**: Table-driven with `assertPanics(t, name, fn, wantMsg)`
5. **Naming**: Subtest names are kebab-case (`mixed_types`, not `mixedTypes`)

## Test Helpers

| Helper | Location | Purpose |
|--------|----------|---------|
| `assertRender(t, o)` | `pkg/builder/utils_test.go` | Renders Type, validates Jsonnet, compares to golden |
| `assertRenderBytes(t, output)` | `pkg/builder/utils_test.go` | Validates and compares raw string output to golden |
| `formatDebug(t, path, content)` | `pkg/builder/utils_test.go`, `pkg/integration/integration_test.go` | Formats content, dumps raw on failure |
| `assertPanics(t, name, fn, wantMsg)` | `pkg/builder/utils_test.go` | Verifies fn panics with optional message check |
