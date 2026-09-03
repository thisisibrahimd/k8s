local mod = import './simple_array.modifier.libsonnet';
local base = { metadata: { finalizers: ['a', 'b'] } };

base + mod.mapFinalizers(function(x) x + '-modified')
