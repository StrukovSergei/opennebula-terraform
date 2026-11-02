resource "opennebula_group" "appdevs" {
  name = "AppDevs"

  lifecycle {
    prevent_destroy = true
  }
}
