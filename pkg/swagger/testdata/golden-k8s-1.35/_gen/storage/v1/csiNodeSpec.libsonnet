{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='csiNodeSpec', url='', help='"CSINodeSpec holds information about the specification of all CSI drivers installed on a node"'),
  '#mapDrivers':: d.fn(help='"drivers is a list of information of all CSI Drivers existing on a node. If all drivers in the list are uninstalled, this can become empty."\n\n**Note:** This function maps each element using the provided function', args=[d.arg(name='f', type=d.T['function'])]),
  mapDrivers(f): { drivers: std.map(f, super.drivers) },
  '#mapDriversByName':: d.fn(help='"drivers is a list of information of all CSI Drivers existing on a node. If all drivers in the list are uninstalled, this can become empty."\n\n**Note:** This function maps the element matching name using the provided function', args=[d.arg(name='name', type=d.T.string), d.arg(name='transformFunc', type=d.T['function'])]),
  mapDriversByName(name, transformFunc): { drivers: [if c.name == name then transformFunc(c) else c for c in super.drivers] },
  '#withDrivers':: d.fn(help='"drivers is a list of information of all CSI Drivers existing on a node. If all drivers in the list are uninstalled, this can become empty."', args=[d.arg(name='drivers', type=d.T.array)]),
  withDrivers(drivers): { drivers: if std.isArray(v=drivers) then drivers else [drivers] },
  '#withDriversMixin':: d.fn(help='"drivers is a list of information of all CSI Drivers existing on a node. If all drivers in the list are uninstalled, this can become empty."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='drivers', type=d.T.array)]),
  withDriversMixin(drivers): { drivers+: if std.isArray(v=drivers) then drivers else [drivers] },
  '#mixin': 'ignore',
  mixin: self,
}
