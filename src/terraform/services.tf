resource "google_project_service" "container_registry" {

  project = google_project.main.project_id
  service = "containerregistry.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}