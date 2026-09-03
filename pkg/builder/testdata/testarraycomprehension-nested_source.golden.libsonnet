{
  result: [ if c.name == name then c else c for c in super.spec.containers ]
}