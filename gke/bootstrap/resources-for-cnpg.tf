resource "google_storage_bucket" "backup_storage" {
  project  = var.project_id
  name     = "${var.cluster_prefix}-${var.project_id}-bk"
  location = "EU"

  uniform_bucket_level_access = true
  force_destroy               = true
}

resource "google_service_account" "cloudnative_pg_sa" {
  account_id   = "cloudnative-pg"
  display_name = "A service account for cloudnative-pg"
}

resource "google_project_iam_member" "cloudnative_pg_sa_roles_binding" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.cloudnative_pg_sa.email}"
}

resource "google_service_account_iam_binding" "gke_sa_impersonate" {
  service_account_id = google_service_account.cloudnative_pg_sa.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:cloudnative-pg@${var.project_id}.iam.gserviceaccount.com",
  ]
}
