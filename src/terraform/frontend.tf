resource "google_storage_bucket" "frontend" {

  project  = google_project.main.project_id
  name     = "${var.application_name}-${var.environment_name}-frontend"
  location = "US"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  cors {
    origin          = ["*"]
    method          = ["GET", "HEAD"]
    response_header = ["Authorization", "Content-Type"]
    max_age_seconds = 3600
  }
}

resource "google_storage_bucket_iam_binding" "public_read" {
  bucket = google_storage_bucket.static_site.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers"
  ]
}