local mod = import './nested_path.modifier.libsonnet';
local base = { spec: { containers: [{ name: 'app', image: 'v1' }] } };

base + mod.mapContainers(function(c) c { image: 'v2' })
