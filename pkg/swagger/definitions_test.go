package swagger

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestDefinitions_FilterAll(t *testing.T) {
	defs := Definitions{
		"a": &Schema{Type: TypeString},
		"b": &Schema{Type: TypeInt},
		"c": &Schema{Type: TypeBool},
	}

	result := defs.Filter(func(k string, v Schema) bool { return true })
	assert.Len(t, result, 3)
}

func TestDefinitions_FilterNone(t *testing.T) {
	defs := Definitions{
		"a": &Schema{Type: TypeString},
		"b": &Schema{Type: TypeInt},
	}

	result := defs.Filter(func(k string, v Schema) bool { return false })
	assert.Empty(t, result)
}

func TestDefinitions_FilterSubset(t *testing.T) {
	defs := Definitions{
		"io.k8s.api.core.v1.Pod":      &Schema{Type: TypeObject},
		"io.k8s.api.core.v1.Service":  &Schema{Type: TypeObject},
		"io.k8s.api.apps.v1.Deployment": &Schema{Type: TypeObject},
	}

	result := defs.Filter(func(k string, v Schema) bool {
		return k == "io.k8s.api.core.v1.Pod" || k == "io.k8s.api.core.v1.Service"
	})
	assert.Len(t, result, 2)
	assert.Contains(t, result, "io.k8s.api.core.v1.Pod")
	assert.Contains(t, result, "io.k8s.api.core.v1.Service")
}

func TestDefinitions_FilterEmpty(t *testing.T) {
	defs := Definitions{}
	result := defs.Filter(func(k string, v Schema) bool { return true })
	assert.Empty(t, result)
}

func TestDefinitions_Sub_PrefixMatch(t *testing.T) {
	defs := Definitions{
		"io.k8s.api.core.v1.Pod":      &Schema{Type: TypeObject},
		"io.k8s.api.core.v1.Service":  &Schema{Type: TypeObject},
		"io.k8s.api.apps.v1.Deployment": &Schema{Type: TypeObject},
	}

	result := defs.Sub("^io\\.k8s\\.api\\.core\\..*")
	assert.Len(t, result, 2)
	assert.Contains(t, result, "io.k8s.api.core.v1.Pod")
	assert.Contains(t, result, "io.k8s.api.core.v1.Service")
}

func TestDefinitions_Sub_NoMatch(t *testing.T) {
	defs := Definitions{
		"io.k8s.api.core.v1.Pod": &Schema{Type: TypeObject},
	}

	result := defs.Sub("^nonexistent")
	assert.Empty(t, result)
}

func TestDefinitions_Sub_Empty(t *testing.T) {
	defs := Definitions{}
	result := defs.Sub(".*")
	assert.Empty(t, result)
}
