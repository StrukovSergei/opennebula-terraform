resource "opennebula_service_template" "web_db_stack" {
  name     = "Web-DB-Stack"
  template = file("${path.module}/oneflow-template.json")

  lifecycle {
    prevent_destroy = true
  }
}
