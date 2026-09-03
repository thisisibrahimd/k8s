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
  mapContainers(f): { spec+: { containers: std.map(f, super.containers) } }
}