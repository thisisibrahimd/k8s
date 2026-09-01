# Testing Guide

## Running Tests

```bash
# All tests
go test ./...

# Specific package
go test ./pkg/builder/...

# With coverage
go test ./... -cover -coverprofile=coverage.out
go tool cover -html=coverage.out

# Verbose output
go test ./... -v

# Run single test
go test ./pkg/builder/... -run TestObjectPrimitive

# Run single subtest
go test ./pkg/builder/... -run TestObjectPrimitive/mixed_types
```

## Golden Tests

Golden tests compare rendered output against fixture files. Generated Jsonnet is validated via `formatter.Format()` to ensure syntax correctness.

### Directory Structure

```
pkg/builder/testdata/
└── TestName/
    └── subtest-name.golden.libsonnet
```

Golden files follow the pattern: `testdata/<TestName>/<subtest-name>.golden.libsonnet`

### Updating Golden Fixtures

```bash
# Regenerate all golden files
go test ./pkg/builder/... -update

# Regenerate for a specific test
go test ./pkg/builder/... -run TestObjectPrimitive -update
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
3. Validates output is syntactically valid Jsonnet via `formatter.Format()`

## Fuzz Tests

Fuzz tests find edge cases via randomized input. Run with:

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

## Test Structure

| File | Purpose |
|---|---|
| `*_test.go` | Table-driven unit tests with golden files |
| `fuzz_test.go` | Fuzz tests for edge cases |
| `property_test.go` | Property-based invariants |
| `benchmark_test.go` | Performance benchmarks |
| `utils_test.go` | Shared helpers (`assertRender`, `assertPanics`, `assertValidJsonnet`) |
| `testdata/` | Golden fixtures and fuzz corpus |

## Conventions

1. **Table-driven**: All tests use table-driven format
2. **Golden files**: Type rendering tests use golden fixtures, not inline strings
3. **Validation**: All golden outputs validated as syntactically valid Jsonnet
4. **Panic tests**: Table-driven with `assertPanics(t, name, fn, wantMsg)`
5. **Naming**: Subtest names are kebab-case (`mixed_types`, not `mixedTypes`)

## Test Helpers

| Helper | Purpose |
|---|---|
| `assertRender(t, o)` | Renders Type, validates Jsonnet, compares to golden |
| `assertRenderBytes(t, output)` | Validates and compares raw string output to golden |
| `assertValidJsonnet(t, output)` | Validates output is syntactically valid Jsonnet |
| `assertPanics(t, name, fn, wantMsg)` | Verifies fn panics with optional message check |
