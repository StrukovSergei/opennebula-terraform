resource "opennebula_host" "kvm" {
  name       = "ubuntu"
  type       = "kvm"
  cluster_id = 0

  # Existing host settings to preserve:
  # RESERVED_CPU = "-100%"
  # RESERVED_MEM = "1048576"

  lifecycle {
    prevent_destroy = true
  }
}
