resource "opennebula_group_quotas" "appdevs_vm" {
  group_id = opennebula_group.appdevs.id

  vm {
    vms              = 4
    running_vms      = 4
    cpu              = 4
    running_cpu      = 4
    memory           = 8192
    running_memory   = 8192
    system_disk_size = 30720
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "opennebula_group_quotas" "appdevs_datastore" {
  group_id = opennebula_group.appdevs.id

  datastore {
    id     = 1
    size   = 30720
    images = -1
  }

  lifecycle {
    prevent_destroy = true
  }
}
