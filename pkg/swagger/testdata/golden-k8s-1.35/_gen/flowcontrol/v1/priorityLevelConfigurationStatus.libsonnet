{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='priorityLevelConfigurationStatus', url='', help='"PriorityLevelConfigurationStatus represents the current state of a \\"request-priority\\"."'),
  '#mapConditions':: d.fn(help='"`conditions` is the current state of \\"request-priority\\"."\n\n**Note:** This function maps each element using the provided function', args=[d.arg(name='f', type=d.T['function'])]),
  mapConditions(f): { conditions: std.map(f, super.conditions) },
  '#withConditions':: d.fn(help='"`conditions` is the current state of \\"request-priority\\"."', args=[d.arg(name='conditions', type=d.T.array)]),
  withConditions(conditions): { conditions: if std.isArray(v=conditions) then conditions else [conditions] },
  '#withConditionsMixin':: d.fn(help='"`conditions` is the current state of \\"request-priority\\"."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='conditions', type=d.T.array)]),
  withConditionsMixin(conditions): { conditions+: if std.isArray(v=conditions) then conditions else [conditions] },
  '#mixin': 'ignore',
  mixin: self,
}
