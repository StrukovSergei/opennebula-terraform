data "opennebula_group" "appdevs" {
  name = "AppDevs"
}

output "appdevs_group_id" {
  value = data.opennebula_group.appdevs.id
}
