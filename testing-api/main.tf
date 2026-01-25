resource "null_resource" "call_httpbin" {
  provisioner "local-exec" {
    command = "curl -s https://httpbin.org/get | jq -r  '.url' > httpbin_output.json"
  }
}
