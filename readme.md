Commands

```bash

tofu init -var="digital_ocean_api_token=$DO_API_TOKEN" -backend-config="access_key=$DO_BUCKET_ACCESS_KEY" -backend-config="secret_key=$DO_BUCKET_SECRET_KEY"

git pull && sleep 3 && TF_LOG=INFO tofu apply -var="digital_ocean_api_token=$DO_API_TOKEN" --auto-approve


ansible-playbook -i ./inventory.ini ./playbook-monitoring-setup.yml --ssh-extra-args='-o StrictHostKeyChecking=no'

```