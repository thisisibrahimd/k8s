{
  spec: {
    containers: [
      {
        image: 'new',
        name: 'nginx',
      },
      {
        image: 'old',
        name: 'sidecar',
      },
    ],
  },
}
