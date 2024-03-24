/*
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

resource "google_cloudfunctions_function" "main" {

  project               = google_project.main.project_id
  name                  = "func-${var.application_name}-${var.environment_name}"
  description           = "My function"
  runtime               = "dotnet6"
  source_archive_bucket = google_storage_bucket.backend.name
  source_archive_object = google_storage_bucket_object.deployment.name
  available_memory_mb   = 128
  trigger_http          = true
  entry_point           = "FleetAPI:Function.HandleAsync"

  depends_on = [google_project_service.functions]
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.main.project
  region         = google_cloudfunctions_function.main.region
  cloud_function = google_cloudfunctions_function.main.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
*/