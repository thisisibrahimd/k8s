{
  featureGates: {},
  mapContainerdConfigPatches(f): { containerdConfigPatches: std.map(f, super.containerdConfigPatches) },
  mapContainerdConfigPatchesJson6902(f): { containerdConfigPatchesJSON6902: std.map(f, super.containerdConfigPatchesJSON6902) },
  mapKubeadmConfigPatches(f): { kubeadmConfigPatches: std.map(f, super.kubeadmConfigPatches) },
  mapKubeadmConfigPatchesJson6902(f): { kubeadmConfigPatchesJSON6902: std.map(f, super.kubeadmConfigPatchesJSON6902) },
  mapNodes(f): { nodes: std.map(f, super.nodes) },
  networking: {
    mapDnsSearch(f): { networking+: {
      dnsSearch: std.map(f, super.dnsSearch),
    } },
    withApiServerAddress(apiServerAddress): {
      networking+: {
        apiServerAddress: apiServerAddress,
      },
    },
    withApiServerPort(apiServerPort): {
      networking+: {
        apiServerPort: apiServerPort,
      },
    },
    withDisableDefaultCni(disableDefaultCni): {
      networking+: {
        disableDefaultCNI: disableDefaultCni,
      },
    },
    withDnsSearch(dnsSearch): {
      networking+: {
        dnsSearch: if std.isArray(v=dnsSearch) then dnsSearch else [dnsSearch],
      },
    },
    withDnsSearchMixin(dnsSearch): {
      networking+: {
        dnsSearch+: if std.isArray(v=dnsSearch) then dnsSearch else [dnsSearch],
      },
    },
    withIpFamily(ipFamily): {
      networking+: {
        ipFamily: ipFamily,
      },
    },
    withKubeProxyMode(kubeProxyMode): {
      networking+: {
        kubeProxyMode: kubeProxyMode,
      },
    },
    withPodSubnet(podSubnet): {
      networking+: {
        podSubnet: podSubnet,
      },
    },
    withServiceSubnet(serviceSubnet): {
      networking+: {
        serviceSubnet: serviceSubnet,
      },
    },
  },
  runtimeConfig: {},
  withApiVersion(apiVersion): {
    apiVersion: apiVersion,
  },
  withContainerdConfigPatches(containerdConfigPatches): {
    containerdConfigPatches: if std.isArray(v=containerdConfigPatches) then containerdConfigPatches else [containerdConfigPatches],
  },
  withContainerdConfigPatchesJson6902(containerdConfigPatchesJson6902): {
    containerdConfigPatchesJSON6902: if std.isArray(v=containerdConfigPatchesJson6902) then containerdConfigPatchesJson6902 else [containerdConfigPatchesJson6902],
  },
  withContainerdConfigPatchesJson6902Mixin(containerdConfigPatchesJson6902): {
    containerdConfigPatchesJSON6902+: if std.isArray(v=containerdConfigPatchesJson6902) then containerdConfigPatchesJson6902 else [containerdConfigPatchesJson6902],
  },
  withContainerdConfigPatchesMixin(containerdConfigPatches): {
    containerdConfigPatches+: if std.isArray(v=containerdConfigPatches) then containerdConfigPatches else [containerdConfigPatches],
  },
  withKind(kind): {
    kind: kind,
  },
  withKubeadmConfigPatches(kubeadmConfigPatches): {
    kubeadmConfigPatches: if std.isArray(v=kubeadmConfigPatches) then kubeadmConfigPatches else [kubeadmConfigPatches],
  },
  withKubeadmConfigPatchesJson6902(kubeadmConfigPatchesJson6902): {
    kubeadmConfigPatchesJSON6902: if std.isArray(v=kubeadmConfigPatchesJson6902) then kubeadmConfigPatchesJson6902 else [kubeadmConfigPatchesJson6902],
  },
  withKubeadmConfigPatchesJson6902Mixin(kubeadmConfigPatchesJson6902): {
    kubeadmConfigPatchesJSON6902+: if std.isArray(v=kubeadmConfigPatchesJson6902) then kubeadmConfigPatchesJson6902 else [kubeadmConfigPatchesJson6902],
  },
  withKubeadmConfigPatchesMixin(kubeadmConfigPatches): {
    kubeadmConfigPatches+: if std.isArray(v=kubeadmConfigPatches) then kubeadmConfigPatches else [kubeadmConfigPatches],
  },
  withName(name): {
    name: name,
  },
  withNodes(nodes): {
    nodes: if std.isArray(v=nodes) then nodes else [nodes],
  },
  withNodesMixin(nodes): {
    nodes+: if std.isArray(v=nodes) then nodes else [nodes],
  },
}
