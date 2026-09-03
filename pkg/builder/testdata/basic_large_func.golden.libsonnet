{
  large(
    string="string",
    bool=true,
    number=5,
    map={ foo: "bar" }
  ):: {
    m: map,
    b: bool,
    s: string,
    n: number
  }
}