{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='hostAlias', url='', help="\"HostAlias holds the mapping between IP and hostnames that will be injected as an entry in the pod's hosts file.\""),
  '#mapHostnames':: d.fn(help='"Hostnames for the above IP address."\n\n**Note:** This function maps each element using the provided function', args=[d.arg(name='f', type=d.T['function'])]),
  mapHostnames(f): { hostnames: std.map(f, super.hostnames) },
  '#withHostnames':: d.fn(help='"Hostnames for the above IP address."', args=[d.arg(name='hostnames', type=d.T.array)]),
  withHostnames(hostnames): { hostnames: if std.isArray(v=hostnames) then hostnames else [hostnames] },
  '#withHostnamesMixin':: d.fn(help='"Hostnames for the above IP address."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='hostnames', type=d.T.array)]),
  withHostnamesMixin(hostnames): { hostnames+: if std.isArray(v=hostnames) then hostnames else [hostnames] },
  '#withIp':: d.fn(help='"IP address of the host file entry."', args=[d.arg(name='ip', type=d.T.string)]),
  withIp(ip): { ip: ip },
  '#mixin': 'ignore',
  mixin: self,
}
