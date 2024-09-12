[![Massdriver][logo]][website]

# gcp-healthcare-fhir-store

[![Release][release_shield]][release_url]
[![Contributors][contributors_shield]][contributors_url]
[![Forks][forks_shield]][forks_url]
[![Stargazers][stars_shield]][stars_url]
[![Issues][issues_shield]][issues_url]
[![MIT License][license_shield]][license_url]


Fast Healthcare Interoperability Resources (FHIR) is a healthcare data standard with an application programming interface (API) for representing and exchanging electronic health records (EHR).


---

## Design

For detailed information, check out our [Operator Guide](operator.md) for this bundle.

## Usage

Our bundles aren't intended to be used locally, outside of testing. Instead, our bundles are designed to be configured, connected, deployed and monitored in the [Massdriver][website] platform.

### What are Bundles?

Bundles are the basic building blocks of infrastructure, applications, and architectures in [Massdriver][website]. Read more [here](https://docs.massdriver.cloud/concepts/bundles).

## Bundle

### Params

Form input parameters for configuring a bundle for deployment.

<details>
<summary>View</summary>

<!-- PARAMS:START -->
## Properties

- **`enable_referential_integrity`** *(boolean)*: [Referential integrity](https://cloud.google.com/healthcare-api/docs/concepts/fhir-referential-integrity) will protect the FHIR store against operations that will result in an inconsistent state, such as creating/updating/patching a resource with a reference to a non-existent resource, or deleting a resource that is referenced by other resources.  This field cannot be changed after creation. Default: `True`.
- **`enable_resource_versioning`** *(boolean)*: Resource versioning will cause all write operations to create historic versions, which can be fetched through the history APIs (but cannot be updated). This field cannot be changed after creation. Default: `True`.
- **`enable_update_create`** *(boolean)*: [Enabling updateCreate](https://cloud.google.com/healthcare-api/docs/reference/rest/v1/projects.locations.datasets.fhirStores#FhirStore.FIELDS.enable_update_create) will allow a client to use the `update` operation to create new identities on the server. If false, all identities are server-assigned through the `create` operation and attempts to `update` a non-existent resource will return errors. Default: `False`.
- **`fhir_version`** *(string)*: The FHIR specification version. Must be one of: `['DSTU2', 'STU3', 'R4']`. Default: `STU3`.
## Examples

  ```json
  {
      "__name": "DSTU2",
      "enable_referential_integrity": true,
      "enable_resource_versioning": true,
      "enable_update_create": false,
      "fhir_version": "DSTU2"
  }
  ```

  ```json
  {
      "__name": "STU3",
      "enable_referential_integrity": true,
      "enable_resource_versioning": true,
      "enable_update_create": false,
      "fhir_version": "STU3"
  }
  ```

  ```json
  {
      "__name": "R4",
      "enable_referential_integrity": true,
      "enable_resource_versioning": true,
      "enable_update_create": false,
      "fhir_version": "R4"
  }
  ```

<!-- PARAMS:END -->

</details>

### Connections

Connections from other bundles that this bundle depends on.

<details>
<summary>View</summary>

<!-- CONNECTIONS:START -->
## Properties

- **`dataset`** *(object)*: GCP Healthcare Dataset.
  - **`data`** *(object)*
    - **`infrastructure`** *(object)*: Minimal GCP Infrastructure Config. Cannot contain additional properties.
      - **`grn`** *(string)*: GCP Resource Name (GRN).

        Examples:
        ```json
        "projects/my-project/global/networks/my-global-network"
        ```

        ```json
        "projects/my-project/regions/us-west2/subnetworks/my-subnetwork"
        ```

        ```json
        "projects/my-project/topics/my-pubsub-topic"
        ```

        ```json
        "projects/my-project/subscriptions/my-pubsub-subscription"
        ```

        ```json
        "projects/my-project/locations/us-west2/instances/my-redis-instance"
        ```

        ```json
        "projects/my-project/locations/us-west2/clusters/my-gke-cluster"
        ```

    - **`security`** *(object)*: GCP Security Configuration. Cannot contain additional properties.
      - **`iam`** *(object)*: IAM Roles And Conditions. Cannot contain additional properties.
        - **`^[a-z]+[a-z_]*[a-z]$`** *(object)*
          - **`condition`** *(string)*: GCP IAM Condition.
          - **`role`**: GCP Role.

            Examples:
            ```json
            "roles/owner"
            ```

            ```json
            "roles/redis.editor"
            ```

            ```json
            "roles/storage.objectCreator"
            ```

            ```json
            "roles/storage.legacyObjectReader"
            ```

  - **`specs`** *(object)*
    - **`gcp`** *(object)*: .
      - **`project`** *(string)*
      - **`region`** *(string)*: The GCP region to provision resources in.

        Examples:
        ```json
        "us-east1"
        ```

        ```json
        "us-east4"
        ```

        ```json
        "us-west1"
        ```

        ```json
        "us-west2"
        ```

        ```json
        "us-west3"
        ```

        ```json
        "us-west4"
        ```

        ```json
        "us-central1"
        ```

- **`gcp_authentication`** *(object)*: GCP Service Account. Cannot contain additional properties.
  - **`data`** *(object)*
    - **`auth_provider_x509_cert_url`** *(string)*: Auth Provider x509 Certificate URL. Default: `https://www.googleapis.com/oauth2/v1/certs`.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`auth_uri`** *(string)*: Auth URI. Default: `https://accounts.google.com/o/oauth2/auth`.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`client_email`** *(string)*: Service Account Email.

      Examples:
      ```json
      "jimmy@massdriver.cloud"
      ```

      ```json
      "service-account-y@gmail.com"
      ```

    - **`client_id`** *(string)*: .
    - **`client_x509_cert_url`** *(string)*: Client x509 Certificate URL.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`private_key`** *(string)*: .
    - **`private_key_id`** *(string)*: .
    - **`project_id`** *(string)*: .
    - **`token_uri`** *(string)*: Token URI. Default: `https://oauth2.googleapis.com/token`.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`type`** *(string)*: . Default: `service_account`.
  - **`specs`** *(object)*
    - **`gcp`** *(object)*: .
      - **`project`** *(string)*
      - **`region`** *(string)*: The GCP region to provision resources in.

        Examples:
        ```json
        "us-east1"
        ```

        ```json
        "us-east4"
        ```

        ```json
        "us-west1"
        ```

        ```json
        "us-west2"
        ```

        ```json
        "us-west3"
        ```

        ```json
        "us-west4"
        ```

        ```json
        "us-central1"
        ```

- **`pubsub_topic`** *(object)*: GCP PubSub Topic. Cannot contain additional properties.
  - **`data`** *(object)*: Cannot contain additional properties.
    - **`infrastructure`** *(object)*: PubSub topic configuration. Cannot contain additional properties.
      - **`grn`** *(string)*: GCP Resource Name (GRN).

        Examples:
        ```json
        "projects/my-project/global/networks/my-global-network"
        ```

        ```json
        "projects/my-project/regions/us-west2/subnetworks/my-subnetwork"
        ```

        ```json
        "projects/my-project/topics/my-pubsub-topic"
        ```

        ```json
        "projects/my-project/subscriptions/my-pubsub-subscription"
        ```

        ```json
        "projects/my-project/locations/us-west2/instances/my-redis-instance"
        ```

        ```json
        "projects/my-project/locations/us-west2/clusters/my-gke-cluster"
        ```

    - **`security`** *(object)*: GCP Security Configuration. Cannot contain additional properties.
      - **`iam`** *(object)*: IAM Roles And Conditions. Cannot contain additional properties.
        - **`^[a-z]+[a-z_]*[a-z]$`** *(object)*
          - **`condition`** *(string)*: GCP IAM Condition.
          - **`role`**: GCP Role.

            Examples:
            ```json
            "roles/owner"
            ```

            ```json
            "roles/redis.editor"
            ```

            ```json
            "roles/storage.objectCreator"
            ```

            ```json
            "roles/storage.legacyObjectReader"
            ```

  - **`specs`** *(object)*
    - **`topic`** *(object)*: . Cannot contain additional properties.
      - **`distribution`** *(string)*: Must be one of: `['pubsub']`.
<!-- CONNECTIONS:END -->

</details>

### Artifacts

Resources created by this bundle that can be connected to other bundles.

<details>
<summary>View</summary>

<!-- ARTIFACTS:START -->
## Properties

- **`fhir_store`** *(object)*: GCP Healthcare FHIR Store.
  - **`data`** *(object)*
    - **`infrastructure`** *(object)*: Minimal GCP Infrastructure Config. Cannot contain additional properties.
      - **`grn`** *(string)*: GCP Resource Name (GRN).

        Examples:
        ```json
        "projects/my-project/global/networks/my-global-network"
        ```

        ```json
        "projects/my-project/regions/us-west2/subnetworks/my-subnetwork"
        ```

        ```json
        "projects/my-project/topics/my-pubsub-topic"
        ```

        ```json
        "projects/my-project/subscriptions/my-pubsub-subscription"
        ```

        ```json
        "projects/my-project/locations/us-west2/instances/my-redis-instance"
        ```

        ```json
        "projects/my-project/locations/us-west2/clusters/my-gke-cluster"
        ```

    - **`security`** *(object)*: GCP Security Configuration. Cannot contain additional properties.
      - **`iam`** *(object)*: IAM Roles And Conditions. Cannot contain additional properties.
        - **`^[a-z]+[a-z_]*[a-z]$`** *(object)*
          - **`condition`** *(string)*: GCP IAM Condition.
          - **`role`**: GCP Role.

            Examples:
            ```json
            "roles/owner"
            ```

            ```json
            "roles/redis.editor"
            ```

            ```json
            "roles/storage.objectCreator"
            ```

            ```json
            "roles/storage.legacyObjectReader"
            ```

  - **`specs`** *(object)*
    - **`gcp`** *(object)*: .
      - **`project`** *(string)*
      - **`region`** *(string)*: The GCP region to provision resources in.

        Examples:
        ```json
        "us-east1"
        ```

        ```json
        "us-east4"
        ```

        ```json
        "us-west1"
        ```

        ```json
        "us-west2"
        ```

        ```json
        "us-west3"
        ```

        ```json
        "us-west4"
        ```

        ```json
        "us-central1"
        ```

<!-- ARTIFACTS:END -->

</details>

## Contributing

<!-- CONTRIBUTING:START -->

### Bug Reports & Feature Requests

Did we miss something? Please [submit an issue](https://github.com/massdriver-cloud/gcp-healthcare-fhir-store/issues) to report any bugs or request additional features.

### Developing

**Note**: Massdriver bundles are intended to be tightly use-case scoped, intention-based, reusable pieces of IaC for use in the [Massdriver][website] platform. For this reason, major feature additions that broaden the scope of an existing bundle are likely to be rejected by the community.

Still want to get involved? First check out our [contribution guidelines](https://docs.massdriver.cloud/bundles/contributing).

### Fix or Fork

If your use-case isn't covered by this bundle, you can still get involved! Massdriver is designed to be an extensible platform. Fork this bundle, or [create your own bundle from scratch](https://docs.massdriver.cloud/bundles/development)!

<!-- CONTRIBUTING:END -->

## Connect

<!-- CONNECT:START -->

Questions? Concerns? Adulations? We'd love to hear from you!

Please connect with us!

[![Email][email_shield]][email_url]
[![GitHub][github_shield]][github_url]
[![LinkedIn][linkedin_shield]][linkedin_url]
[![Twitter][twitter_shield]][twitter_url]
[![YouTube][youtube_shield]][youtube_url]
[![Reddit][reddit_shield]][reddit_url]

<!-- markdownlint-disable -->

[logo]: https://raw.githubusercontent.com/massdriver-cloud/docs/main/static/img/logo-with-logotype-horizontal-400x110.svg
[docs]: https://docs.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=gcp-healthcare-fhir-store&utm_content=docs
[website]: https://www.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=gcp-healthcare-fhir-store&utm_content=website
[github]: https://github.com/massdriver-cloud?utm_source=github&utm_medium=readme&utm_campaign=gcp-healthcare-fhir-store&utm_content=github
[slack]: https://massdriverworkspace.slack.com/?utm_source=github&utm_medium=readme&utm_campaign=gcp-healthcare-fhir-store&utm_content=slack
[linkedin]: https://www.linkedin.com/company/massdriver/?utm_source=github&utm_medium=readme&utm_campaign=gcp-healthcare-fhir-store&utm_content=linkedin



[contributors_shield]: https://img.shields.io/github/contributors/massdriver-cloud/gcp-healthcare-fhir-store.svg?style=for-the-badge
[contributors_url]: https://github.com/massdriver-cloud/gcp-healthcare-fhir-store/graphs/contributors
[forks_shield]: https://img.shields.io/github/forks/massdriver-cloud/gcp-healthcare-fhir-store.svg?style=for-the-badge
[forks_url]: https://github.com/massdriver-cloud/gcp-healthcare-fhir-store/network/members
[stars_shield]: https://img.shields.io/github/stars/massdriver-cloud/gcp-healthcare-fhir-store.svg?style=for-the-badge
[stars_url]: https://github.com/massdriver-cloud/gcp-healthcare-fhir-store/stargazers
[issues_shield]: https://img.shields.io/github/issues/massdriver-cloud/gcp-healthcare-fhir-store.svg?style=for-the-badge
[issues_url]: https://github.com/massdriver-cloud/gcp-healthcare-fhir-store/issues
[release_url]: https://github.com/massdriver-cloud/gcp-healthcare-fhir-store/releases/latest
[release_shield]: https://img.shields.io/github/release/massdriver-cloud/gcp-healthcare-fhir-store.svg?style=for-the-badge
[license_shield]: https://img.shields.io/github/license/massdriver-cloud/gcp-healthcare-fhir-store.svg?style=for-the-badge
[license_url]: https://github.com/massdriver-cloud/gcp-healthcare-fhir-store/blob/main/LICENSE


[email_url]: mailto:support@massdriver.cloud
[email_shield]: https://img.shields.io/badge/email-Massdriver-black.svg?style=for-the-badge&logo=mail.ru&color=000000
[github_url]: mailto:support@massdriver.cloud
[github_shield]: https://img.shields.io/badge/follow-Github-black.svg?style=for-the-badge&logo=github&color=181717
[linkedin_url]: https://linkedin.com/in/massdriver-cloud
[linkedin_shield]: https://img.shields.io/badge/follow-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&color=0A66C2
[twitter_url]: https://twitter.com/massdriver?utm_source=github&utm_medium=readme&utm_campaign=gcp-healthcare-fhir-store&utm_content=twitter
[twitter_shield]: https://img.shields.io/badge/follow-Twitter-black.svg?style=for-the-badge&logo=twitter&color=1DA1F2
[discourse_url]: https://community.massdriver.cloud?utm_source=github&utm_medium=readme&utm_campaign=gcp-healthcare-fhir-store&utm_content=discourse
[discourse_shield]: https://img.shields.io/badge/join-Discourse-black.svg?style=for-the-badge&logo=discourse&color=000000
[youtube_url]: https://www.youtube.com/channel/UCfj8P7MJcdlem2DJpvymtaQ
[youtube_shield]: https://img.shields.io/badge/subscribe-Youtube-black.svg?style=for-the-badge&logo=youtube&color=FF0000
[reddit_url]: https://www.reddit.com/r/massdriver
[reddit_shield]: https://img.shields.io/badge/subscribe-Reddit-black.svg?style=for-the-badge&logo=reddit&color=FF4500

<!-- markdownlint-restore -->

<!-- CONNECT:END -->
