package swagger

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestCRDLoader_SingleCRD(t *testing.T) {
	data, err := os.ReadFile(filepath.Join("testdata", "single-crd.yaml"))
	require.NoError(t, err)

	loader := &CRDLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	// Key is reversed group + version + kind
	key := "io.cert-manager.v1.Certificate"
	cert := defs[key]
	require.NotNil(t, cert, "expected definition for %s", key)
	assert.Equal(t, TypeObject, cert.Type)
	assert.Contains(t, cert.Desc, "Certificate is a cert-manager resource")

	// Scope should be Namespaced
	require.NotNil(t, cert.Scope)
	assert.Equal(t, "Namespaced", *cert.Scope)

	// GVK should be populated
	require.Len(t, cert.XGvk, 1)
	assert.Equal(t, "cert-manager.io", cert.XGvk[0].Group)
	assert.Equal(t, "Certificate", cert.XGvk[0].Kind)
	assert.Equal(t, "v1", cert.XGvk[0].Version)
}

func TestCRDLoader_MultiCRD(t *testing.T) {
	data, err := os.ReadFile(filepath.Join("testdata", "multi-crd.yaml"))
	require.NoError(t, err)

	loader := &CRDLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	// Should have 2 definitions (Certificate + Issuer)
	assert.Len(t, defs, 2)
	assert.Contains(t, defs, "io.cert-manager.v1.Certificate")
	assert.Contains(t, defs, "io.cert-manager.v1.Issuer")
}

func TestCRDLoader_NestedProperties(t *testing.T) {
	data, err := os.ReadFile(filepath.Join("testdata", "single-crd.yaml"))
	require.NoError(t, err)

	loader := &CRDLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	cert := defs["io.cert-manager.v1.Certificate"]
	require.NotNil(t, cert)

	// spec should be an object with nested properties
	spec := cert.Props["spec"]
	require.NotNil(t, spec)
	assert.Equal(t, TypeObject, spec.Type)

	// issuerRef should have name and kind properties
	issuerRef := spec.Props["issuerRef"]
	require.NotNil(t, issuerRef)
	assert.Equal(t, TypeObject, issuerRef.Type)
	assert.Contains(t, issuerRef.Props, "name")
	assert.Contains(t, issuerRef.Props, "kind")
}

func TestCRDLoader_ArrayItems(t *testing.T) {
	data, err := os.ReadFile(filepath.Join("testdata", "single-crd.yaml"))
	require.NoError(t, err)

	loader := &CRDLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	cert := defs["io.cert-manager.v1.Certificate"]
	require.NotNil(t, cert)

	spec := cert.Props["spec"]
	require.NotNil(t, spec)

	dnsNames := spec.Props["dnsNames"]
	require.NotNil(t, dnsNames)
	assert.Equal(t, TypeArray, dnsNames.Type)
	require.NotNil(t, dnsNames.Items)
	assert.Equal(t, TypeString, dnsNames.Items.Type)
}

func TestCRDLoader_MetadataInjected(t *testing.T) {
	data, err := os.ReadFile(filepath.Join("testdata", "single-crd.yaml"))
	require.NoError(t, err)

	loader := &CRDLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	cert := defs["io.cert-manager.v1.Certificate"]
	require.NotNil(t, cert)

	// Top-level should have metadata
	assert.Contains(t, cert.Props, "metadata", "top-level props should have metadata")

	// Nested objects should NOT have metadata injected
	spec := cert.Props["spec"]
	require.NotNil(t, spec)
	assert.NotContains(t, spec.Props, "metadata", "nested props should not have metadata")
}

func TestCRDLoader_InvalidYAML(t *testing.T) {
	loader := &CRDLoader{}
	_, err := loader.Load([]byte(": : : invalid"))
	require.Error(t, err)
}

func TestCRDLoader_EmptyYAML(t *testing.T) {
	loader := &CRDLoader{}
	defs, err := loader.Load([]byte(""))
	require.NoError(t, err)
	assert.Empty(t, defs)
}

func TestCRDLoader_MinimalCRD(t *testing.T) {
	data, err := os.ReadFile(filepath.Join("testdata", "minimal-crd.yaml"))
	require.NoError(t, err)

	loader := &CRDLoader{}
	defs, err := loader.Load(data)
	require.NoError(t, err)

	key := "com.example.v1.Minimal"
	minimal := defs[key]
	require.NotNil(t, minimal, "expected definition for %s", key)
	assert.Equal(t, TypeObject, minimal.Type)

	// Scope should be Cluster
	require.NotNil(t, minimal.Scope)
	assert.Equal(t, "Cluster", *minimal.Scope)

	// No properties means empty Props map (except metadata injected at top level)
	assert.Contains(t, minimal.Props, "metadata")
}
