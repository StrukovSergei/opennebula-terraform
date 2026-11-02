resource "opennebula_datastore" "default" {
  name        = "default"
  type        = "image"
  cluster_ids = [0]

  restricted_directories = "/"
  safe_directories       = "/var/tmp"

  custom {
    datastore = "fs"
    transfer  = "local"
  }

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      custom,
      cluster_ids
    ]
  }
}


resource "opennebula_datastore" "files" {
  name        = "files"
  type        = "file"
  cluster_ids = [0]

  restricted_directories = "/"
  safe_directories       = "/var/tmp"

  custom {
    datastore = "fs"
    transfer  = "local"
  }

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      custom,
      cluster_ids
    ]
  }
}


resource "opennebula_datastore" "system" {
  name        = "system"
  type        = "system"
  cluster_ids = [0]

  restricted_directories = "/"
  safe_directories       = "/var/tmp"

  custom {
    transfer = "local"
  }

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      custom,
      cluster_ids
    ]
  }
}
