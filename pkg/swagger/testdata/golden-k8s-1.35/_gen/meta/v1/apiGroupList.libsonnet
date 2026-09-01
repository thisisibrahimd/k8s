{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='apiGroupList', url='', help='"APIGroupList is a list of APIGroup, to allow clients to discover the API at /apis."'),
  '#mapGroups':: d.fn(help='"groups is a list of APIGroup."\n\n**Note:** This function maps each element using the provided function', args=[d.arg(name='f', type=d.T['function'])]),
  mapGroups(f): { groups: std.map(f, super.groups) },
  '#mapGroupsByName':: d.fn(help='"groups is a list of APIGroup."\n\n**Note:** This function maps the element matching name using the provided function', args=[d.arg(name='name', type=d.T.string), d.arg(name='transformFunc', type=d.T['function'])]),
  mapGroupsByName(name, transformFunc): { groups: [if c.name == name then transformFunc(c) else c for c in super.groups] },
  '#new':: d.fn(help='new returns an instance of APIGroupList', args=[d.arg(name='name', type=d.T.string)]),
  new(name): {
    apiVersion: 'v1',
    kind: 'APIGroupList',
  } + self.metadata.withName(name=name),
  '#withGroups':: d.fn(help='"groups is a list of APIGroup."', args=[d.arg(name='groups', type=d.T.array)]),
  withGroups(groups): { groups: if std.isArray(v=groups) then groups else [groups] },
  '#withGroupsMixin':: d.fn(help='"groups is a list of APIGroup."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='groups', type=d.T.array)]),
  withGroupsMixin(groups): { groups+: if std.isArray(v=groups) then groups else [groups] },
  '#mixin': 'ignore',
  mixin: self,
}
