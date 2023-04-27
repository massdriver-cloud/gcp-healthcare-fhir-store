resource "massdriver_artifact" "fhir_store" {
  field                = "fhir_store"
  provider_resource_id = google_healthcare_fhir_store.main.id
  name                 = "GCP Healthcare FHIR Store ${var.md_metadata.name_prefix}"
  artifact = jsonencode(
    {
      data = {
        infrastructure = {
          grn = google_healthcare_fhir_store.main.id
        }
        security = {
          iam = {
            read = {
              role      = "roles/healthcare.fhirResourceReader"
              condition = "resource.name.endsWith(\"${var.md_metadata.name_prefix}\")"
            }
            read_write = {
              role      = "roles/healthcare.fhirResourceEditor"
              condition = "resource.name.endsWith(\"${var.md_metadata.name_prefix}\")"
            }
            admin = {
              role      = "roles/healthcare.fhirStoreAdmin"
              condition = "resource.name.endsWith(\"${var.md_metadata.name_prefix}\")"
            }
          }
        }
      }
      specs = {
        gcp = {
          region = var.dataset.specs.gcp.region
        }
      }
    }
  )
}
