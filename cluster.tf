resource "opennebula_cluster" "default" {
  name = "default"

  lifecycle {
    prevent_destroy = true
  }
}
