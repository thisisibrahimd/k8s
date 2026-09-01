{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='serviceCIDRStatus', url='', help='"ServiceCIDRStatus describes the current state of the ServiceCIDR."'),
  '#mapConditions':: d.fn(help='"conditions holds an array of metav1.Condition that describe the state of the ServiceCIDR. Current service state"\n\n**Note:** This function maps each element using the provided function', args=[d.arg(name='f', type=d.T['function'])]),
  mapConditions(f): { conditions: std.map(f, super.conditions) },
  '#withConditions':: d.fn(help='"conditions holds an array of metav1.Condition that describe the state of the ServiceCIDR. Current service state"', args=[d.arg(name='conditions', type=d.T.array)]),
  withConditions(conditions): { conditions: if std.isArray(v=conditions) then conditions else [conditions] },
  '#withConditionsMixin':: d.fn(help='"conditions holds an array of metav1.Condition that describe the state of the ServiceCIDR. Current service state"\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='conditions', type=d.T.array)]),
  withConditionsMixin(conditions): { conditions+: if std.isArray(v=conditions) then conditions else [conditions] },
  '#mixin': 'ignore',
  mixin: self,
}
