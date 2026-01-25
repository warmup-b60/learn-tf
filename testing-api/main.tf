# resource "null_resource" "call_httpbin" {
#   provisioner "local-exec" {
#     command = "curl -s https://httpbin.org/get | jq -r  '.origin' > httpbin_output.json"
#   }
# }


data "external" "httpbin_origins" {
  program = ["bash", "-c", "curl -s https://httpbin.org/get | jq -r '.url' | jq -Rn '{input}'"]
  // program = ["bash", "-c", "curl -s https://httpbin.org/get | jq -r '.url'"]
}

output "url" {
  value = data.external.httpbin_origins.result.url
}