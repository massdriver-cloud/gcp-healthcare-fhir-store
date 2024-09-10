// Auto-generated variable declarations from massdriver.yaml
variable "dataset" {
  type = object({
    data = object({
      infrastructure = object({
        grn = string
      })
      security = object({
        iam = optional(map(object({
          condition = string
          role      = any
        })))
      })
    })
    specs = object({
      gcp = optional(object({
        project = optional(string)
        region  = optional(string)
      }))
    })
  })
}
variable "enable_referential_integrity" {
  type = bool
}
variable "enable_resource_versioning" {
  type = bool
}
variable "enable_update_create" {
  type = bool
}
variable "fhir_version" {
  type = string
}
variable "gcp_authentication" {
  type = object({
    data = object({
      auth_provider_x509_cert_url = string
      auth_uri                    = string
      client_email                = string
      client_id                   = string
      client_x509_cert_url        = string
      private_key                 = string
      private_key_id              = string
      project_id                  = string
      token_uri                   = string
      type                        = string
    })
    specs = object({
      gcp = optional(object({
        project = optional(string)
        region  = optional(string)
      }))
    })
  })
}
variable "md_metadata" {
  type = object({
    default_tags = object({
      managed-by  = string
      md-manifest = string
      md-package  = string
      md-project  = string
      md-target   = string
    })
    deployment = object({
      id = string
    })
    name_prefix = string
    observability = object({
      alarm_webhook_url = string
    })
    package = object({
      created_at             = string
      deployment_enqueued_at = string
      previous_status        = string
      updated_at             = string
    })
    target = object({
      contact_email = string
    })
  })
}
variable "pubsub_topic" {
  type = object({
    data = object({
      infrastructure = object({
        grn = string
      })
      security = object({
        iam = optional(map(object({
          condition = string
          role      = any
        })))
      })
    })
    specs = object({
      topic = optional(object({
        distribution = string
      }))
    })
  })
  default = null
}
