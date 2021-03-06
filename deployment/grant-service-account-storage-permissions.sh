#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
source yaml.sh

create_variables ../params.yaml

echo ${service_account_role_storage_name}

gcloud projects add-iam-policy-binding ${project_id} \
    --member="serviceAccount:${service_account_name}@${project_id}.iam.gserviceaccount.com" \
    --role="${service_account_role_storage_name}" \
    --condition=expression=${service_account_role_storage_condition_expression},title=${service_account_role_storage_condition_title}
