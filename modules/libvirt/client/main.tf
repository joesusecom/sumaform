module "client" {
  source = "../host"
  base_configuration = "${var.base_configuration}"
  name = "${var.name}"
  image = "${var.image}"
  count = "${var.count}"
  memory = "${var.memory}"
  vcpu = "${var.vcpu}"
  running = "${var.running}"
  mac = "${var.mac}"
  grains = <<EOF

version: ${var.version}
package-mirror: ${var.base_configuration["package_mirror"]}
server: ${var.server_configuration["hostname"]}
role: client
for-development-only: ${var.for_development_only == 1 ? "True" : "False"}
for-testsuite-only: ${var.for_testsuite_only == 1 ? "True" : "False"}

EOF
}

output "configuration" {
  value = "${module.client.configuration}"
}
