{
  result: [ if c.name == name then transformFunc(c) else c for c in super.containers ]
}