### Google Cloud Healthcare FHIR Store

The Google Cloud Healthcare API includes a FHIR (Fast Healthcare Interoperability Resources) store, a managed solution that enables secure storage, retrieval, querying, and analysis of healthcare data in the FHIR format.

#### Design Decisions

1. **IAM Roles and Permissions**: The module sets up distinct IAM roles for reading, writing, and administering FHIR resources to facilitate robust access control.
2. **Pub/Sub Integration**: If a Pub/Sub topic is provided, the module configures the FHIR store to publish notifications for specific actions.
3. **Security Controls**: The module includes options to enforce or disable referential integrity and resource versioning, allowing the adaptation of data consistency requirements.
4. **Versioning**: The FHIR version is configurable to cater to various interoperability needs.
5. **Labels and Metadata**: Custom tags and a name prefix can be set to ensure that resources are easily identifiable and traceable.

### Runbook

#### IAM Role Issues

If users cannot access the FHIR store as expected, verify IAM role assignments.

Check current IAM policy bindings for FHIR:

```sh
gcloud projects get-iam-policy [PROJECT_ID] --filter="bindings.role:roles/healthcare.fhirResourceViewer"
```

Replace `[PROJECT_ID]` with your actual project ID. Ensure the necessary service accounts are listed under the appropriate roles.

#### Pub/Sub Notification Issues

If you're not receiving Pub/Sub notifications from the FHIR store, make sure the Pub/Sub topic is correctly configured.

Verify Pub/Sub topic existence:

```sh
gcloud pubsub topics list --filter="name:projects/[PROJECT_ID]/topics/[TOPIC_NAME]"
```

Replace `[PROJECT_ID]` and `[TOPIC_NAME]` with your respective project ID and Pub/Sub topic name. Ensure the topic exists and is correctly named.

Check FHIR store notification configuration:

```sh
gcloud healthcare fhir-stores describe [FHIR_STORE_NAME] --dataset=[DATASET_ID]
```

Replace `[FHIR_STORE_NAME]` and `[DATASET_ID]` with your FHIR store name and dataset ID. Look for the `notificationConfig` section to verify Pub/Sub topic configuration.

#### Data Integrity Problems

If there are issues related to data updates or referential integrity, inspect the FHIR store's configuration settings.

Check FHIR store settings:

```sh
gcloud healthcare fhir-stores describe [FHIR_STORE_NAME] --dataset=[DATASET_ID]
```

Make sure the fields `enableUpdateCreate`, `disableReferentialIntegrity`, and `disableResourceVersioning` are configured as expected.

#### Connectivity Issues

If users are having difficulty accessing the FHIR store, ensure the service account is correctly configured and has the necessary permissions.

Test service account authentication:

```sh
gcloud auth activate-service-account --key-file=[PATH_TO_KEY_FILE]
gcloud auth list
```

Replace `[PATH_TO_KEY_FILE]` with the path to the service account key file. Ensure the correct account is active and has the roles required for FHIR store operations.

