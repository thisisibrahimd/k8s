local d = {
  fn(help='', args=[]): null,
  arg(name='', type=''): null,
  T: {array: 'array', object: 'object', string: 'string', 'function': 'function'},
};

{
  '#withContainers':: d.fn(help="", args=[d.arg(name="containers", type=d.T.array)]),
  withContainers(containers): { spec+: { containers: if std.isArray(v=containers) then containers else [containers] } },
  '#withContainersMixin':: d.fn(help="\n\n**Note:** This function appends passed data to existing values", args=[d.arg(name="containers", type=d.T.array)]),
  withContainersMixin(containers): { spec+: { containers+: if std.isArray(v=containers) then containers else [containers] } },
  '#mapContainers':: d.fn(help="\n\n**Note:** This function maps each element using the provided function", args=[d.arg(name="f", type=d.T['function'])]),
  mapContainers(f): { spec+: { containers: std.map(f, super.containers) } },
  '#mapContainersByName':: d.fn(help="\n\n**Note:** This function maps the element matching name using the provided function", args=[d.arg(name="name", type=d.T.string), d.arg(name="transformFunc", type=d.T['function'])]),
  mapContainersByName(name, transformFunc): { spec+: { containers: [ if c.name == name then transformFunc(c) else c for c in super.containers ] } }
}