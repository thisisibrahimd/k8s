{
  complex(
    name="app",
    replicas=3
  ):: {
    spec: {
      name: "name",
      count: 3
    }
  }
}