# Synthetic read-only reporting fixture. Never deploy this configuration.
resource "google_project_iam_member" "reporting" {
  project = "flare-demo-project"
  role    = "roles/viewer"
  member  = "serviceAccount:reporter@flare-demo-project.iam.gserviceaccount.com"
}
