package writer

import (
	"github.com/thisisibrahimd/k8s/pkg/config"
	"github.com/thisisibrahimd/k8s/pkg/model"
)

type Writer interface {
	Render(dir string, group model.Groups, spec config.Target) error
}
