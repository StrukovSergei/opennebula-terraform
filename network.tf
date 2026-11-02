resource "opennebula_virtual_network" "exam" {
  name   = "ExamPrivateNet"
  type   = "dummy"
  bridge = "br-exam"

  network_address = "10.10.10.0"
  network_mask    = "255.255.255.0"
  gateway         = "10.10.10.1"
  dns             = "8.8.8.8"

  lifecycle {
    prevent_destroy = true
  }
}
