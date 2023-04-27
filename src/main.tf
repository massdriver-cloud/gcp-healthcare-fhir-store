resource "google_healthcare_fhir_store" "main" {
  name    = var.md_metadata.name_prefix
  dataset = var.dataset.data.infrastructure.grn
  version = var.fhir_version
  labels  = var.md_metadata.default_tags

  enable_update_create          = var.enable_update_create
  disable_referential_integrity = !var.enable_referential_integrity
  disable_resource_versioning   = !var.enable_resource_versioning

  dynamic "notification_config" {
    for_each = var.pubsub_topic != null ? ["pubsub"] : []
    content {
      pubsub_topic = var.pubsub_topic.data.infrastructure.grn
    }
  }
}
