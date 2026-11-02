resource "opennebula_image" "ubuntu_minimal" {
  name         = "Ubuntu-Minimal-Exam"
  datastore_id = opennebula_datastore.default.id

  type        = "OS"
  persistent  = false
  format      = "qcow2"
  dev_prefix  = "vd"
  permissions = "640"
  group       = "AppDevs"

  path = "https://marketplace.opennebula.io/appliance/44077b30-f431-013c-b66a-7875a4a4f528/download/0"

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      datastore_id,
      format,
      group,
      type,
      timeout,
      timeouts
    ]
  }
}
