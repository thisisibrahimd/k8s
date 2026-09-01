{
  deploy(
    image="nginx:latest",
    port=80,
    tls=true,
    host="example.com"
  ):: {
    image: "image",
    port: 80,
    tls: true,
    host: "host"
  }
}