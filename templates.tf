resource "opennebula_template" "lb" {
  name        = "LB-Template"
  cpu         = 1
  vcpu        = 1
  memory      = 768
  group       = "AppDevs"
  permissions = "640"

  disk {
    image_id = 0
  }

  nic {
    network_id = 0
    model      = "virtio"
  }

  os {
    arch = "x86_64"
    boot = "disk0"
  }

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      group,
      os[0].boot
    ]
  }
}


resource "opennebula_template" "web" {
  name        = "Web-Template"
  cpu         = 1
  vcpu        = 1
  memory      = 768
  group       = "AppDevs"
  permissions = "640"

  disk {
    image_id = 0
  }

  nic {
    network_id = 0
    model      = "virtio"
  }

  os {
    arch = "x86_64"
    boot = "disk0"
  }

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      group,
      os[0].boot
    ]
  }
}
