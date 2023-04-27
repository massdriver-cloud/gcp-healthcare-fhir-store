data "google_project" "current" {}

resource "google_project_iam_member" "pubsub" {
  count   = var.pubsub_topic != null ? 1 : 0
  project = var.gcp_authentication.data.project_id
  role    = var.pubsub_topic.data.security.iam.publisher.role
  member  = "serviceAccount:service-${data.google_project.current.number}@gcp-sa-healthcare.iam.gserviceaccount.com"

  condition {
    title      = "${var.md_metadata.name_prefix} FHIR Store Notifications"
    expression = var.pubsub_topic.data.security.iam.publisher.condition
  }
}