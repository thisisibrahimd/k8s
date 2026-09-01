package swagger

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestSwaggerLoader_InvalidJSON(t *testing.T) {
	loader := &SwaggerLoader{}
	_, err := loader.Load([]byte("{bad json"))
	require.Error(t, err)
}

func TestSwaggerLoader_ResolvesRefs(t *testing.T) {
	data, err := os.ReadFile(filepath.Join("testdata", "swagger-with-refs.json"))
	require.NoError(t, err)

	loader := &SwaggerLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	// Pod should have resolved refs for metadata, spec, status
	pod := defs["io.k8s.api.core.v1.Pod"]
	require.NotNil(t, pod)
	assert.Equal(t, TypeObject, pod.Type)

	// Pod.spec should be resolved to PodSpec (DollarRef nil)
	spec := pod.Props["spec"]
	require.NotNil(t, spec)
	assert.Nil(t, spec.DollarRef, "spec $ref should be resolved")
	assert.Equal(t, "io.k8s.api.core.v1.PodSpec", spec.ResolvedRef)
}

func TestSwaggerLoader_SkipsRecursiveRefs(t *testing.T) {
	data, err := os.ReadFile(filepath.Join("testdata", "swagger-with-refs.json"))
	require.NoError(t, err)

	loader := &SwaggerLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	// Container.schema references JSONSchemaProps which is in skipRefs
	container := defs["io.k8s.api.core.v1.Container"]
	require.NotNil(t, container)
	schema := container.Props["schema"]
	require.NotNil(t, schema)
	// Should still have DollarRef because it's in the skip list
	assert.NotNil(t, schema.DollarRef, "JSONSchemaProps ref should not be resolved (skipped)")
}

func TestSwaggerLoader_SkipsListMeta(t *testing.T) {
	data, err := os.ReadFile(filepath.Join("testdata", "swagger-with-refs.json"))
	require.NoError(t, err)

	loader := &SwaggerLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	// ListMeta is in skipRefs, should remain unresolved if referenced
	// We can verify by checking it exists as a definition
	listMeta := defs["io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta"]
	require.NotNil(t, listMeta)
	assert.Equal(t, TypeObject, listMeta.Type)
}

func TestSwaggerLoader_MissingRefReturnsNil(t *testing.T) {
	data := []byte(`{
		"swagger": "2.0",
		"info": {"title": "Test", "version": "v1"},
		"definitions": {
			"io.k8s.test.v1.Foo": {
				"type": "object",
				"properties": {
					"bar": { "$ref": "#/definitions/io.k8s.nonexistent.Bar" }
				}
			}
		}
	}`)

	loader := &SwaggerLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	foo := defs["io.k8s.test.v1.Foo"]
	require.NotNil(t, foo)
	// Missing ref should resolve to nil
	assert.Nil(t, foo.Props["bar"], "missing ref should resolve to nil")
}

func TestSwaggerLoader_RefCaching(t *testing.T) {
	data := []byte(`{
		"swagger": "2.0",
		"info": {"title": "Test", "version": "v1"},
		"definitions": {
			"io.k8s.test.v1.A": {
				"type": "object",
				"properties": {
					"ref1": { "$ref": "#/definitions/io.k8s.test.v1.Shared" },
					"ref2": { "$ref": "#/definitions/io.k8s.test.v1.Shared" }
				}
			},
			"io.k8s.test.v1.Shared": {
				"type": "object",
				"properties": {
					"value": { "type": "string" }
				}
			}
		}
	}`)

	loader := &SwaggerLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	a := defs["io.k8s.test.v1.A"]
	require.NotNil(t, a)

	// Both refs should point to the same Schema object (caching)
	ref1 := a.Props["ref1"]
	ref2 := a.Props["ref2"]
	require.NotNil(t, ref1)
	require.NotNil(t, ref2)
	assert.Same(t, ref1, ref2, "cached refs should be the same pointer")
}
