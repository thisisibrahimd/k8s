local d = {
  fn(help='', args=[]): null,
  arg(name='', type=''): null,
  T: {array: 'array', object: 'object', string: 'string', 'function': 'function'},
};

{
  '#withFinalizers':: d.fn(help="", args=[d.arg(name="finalizers", type=d.T.array)]),
  withFinalizers(finalizers): { metadata+: { finalizers: if std.isArray(v=finalizers) then finalizers else [finalizers] } },
  '#withFinalizersMixin':: d.fn(help="\n\n**Note:** This function appends passed data to existing values", args=[d.arg(name="finalizers", type=d.T.array)]),
  withFinalizersMixin(finalizers): { metadata+: { finalizers+: if std.isArray(v=finalizers) then finalizers else [finalizers] } },
  '#mapFinalizers':: d.fn(help="\n\n**Note:** This function maps each element using the provided function", args=[d.arg(name="f", type=d.T['function'])]),
  mapFinalizers(f): { metadata+: { finalizers: std.map(f, super.finalizers) } }
}