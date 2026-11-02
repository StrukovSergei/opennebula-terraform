resource "opennebula_virtual_data_center" "appdevs" {
  name      = "AppDevs-VDC"
  group_ids = [opennebula_group.appdevs.id]

  zones {
    id          = 0
    cluster_ids = [0]
  }

  lifecycle {
    prevent_destroy = true
  }
}
