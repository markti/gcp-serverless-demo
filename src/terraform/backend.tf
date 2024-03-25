
resource "google_storage_bucket" "backend" {

  project  = google_project.main.project_id
  name     = "${var.application_name}-${var.environment_name}-backend-${random_string.project_id.result}"
  location = "US"

  depends_on = [google_project_iam_member.terraform_user_storage]
}

resource "google_storage_bucket_object" "deployment" {
  name   = "deployment.zip"
  bucket = google_storage_bucket.backend.name
  source = "deployment.zip"
}

