local mod = import './by_name.modifier.libsonnet';
local base = { spec: { containers: [{ name: 'nginx', image: 'old' }, { name: 'sidecar', image: 'old' }] } };

base + mod.mapContainersByName('nginx', function(c) c { image: 'new' })
