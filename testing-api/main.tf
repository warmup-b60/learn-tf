# resource "null_resource" "call_httpbin" {
#   provisioner "local-exec" {
#     command = "curl -s https://httpbin.org/get | jq -r  '.origin' > httpbin_output.json"
#   }
# }


data "external" "httpbin_origin" {
  program = ["bash", "-c", "curl -s https://httpbin.org/get | jq -r '.origin' | jq -Rn '{origin: input}'"]
}

output "origin" {
  value = data.external.httpbin_origin.result.origin
}