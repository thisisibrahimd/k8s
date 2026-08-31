{
  containers: {
    withImage(image): {
      containers+: {
        image: image,
      },
    },
    withName(name): {
      containers+: {
        name: name,
      },
    },
  },
  mapContainers(f): { containers: std.map(f, super.containers) },
  mapContainersByName(name, transformFunc): { containers: [if c.name == name then transformFunc(c) else c for c in super.containers] },
  mapTags(f): { tags: std.map(f, super.tags) },
  withContainers(containers): {
    containers: if std.isArray(v=containers) then containers else [containers],
  },
  withContainersMixin(containers): {
    containers+: if std.isArray(v=containers) then containers else [containers],
  },
  withTags(tags): {
    tags: if std.isArray(v=tags) then tags else [tags],
  },
  withTagsMixin(tags): {
    tags+: if std.isArray(v=tags) then tags else [tags],
  },
}
