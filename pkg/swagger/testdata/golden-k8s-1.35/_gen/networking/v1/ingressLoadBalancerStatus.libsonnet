{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='ingressLoadBalancerStatus', url='', help='"IngressLoadBalancerStatus represents the status of a load-balancer."'),
  '#mapIngress':: d.fn(help='"ingress is a list containing ingress points for the load-balancer."\n\n**Note:** This function maps each element using the provided function', args=[d.arg(name='f', type=d.T['function'])]),
  mapIngress(f): { ingress: std.map(f, super.ingress) },
  '#withIngress':: d.fn(help='"ingress is a list containing ingress points for the load-balancer."', args=[d.arg(name='ingress', type=d.T.array)]),
  withIngress(ingress): { ingress: if std.isArray(v=ingress) then ingress else [ingress] },
  '#withIngressMixin':: d.fn(help='"ingress is a list containing ingress points for the load-balancer."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='ingress', type=d.T.array)]),
  withIngressMixin(ingress): { ingress+: if std.isArray(v=ingress) then ingress else [ingress] },
  '#mixin': 'ignore',
  mixin: self,
}
