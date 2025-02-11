export region=europe-west1 
export gke_hub_project_id=""
export artifact_registry_project_id=""
export clustername=""
export artifact_registy_repo=cndb-registry

git clone https://github.com/cloudnative-pg/charts.git 

mv charts cnpg-helm

cd cnpg-helm 

helm package cnpg-helm/charts/cloudnative-pg .

gcloud --project=$artifact_registry_project_id auth print-access-token | helm registry login -u oauth2accesstoken --password-stdin https://$region-docker.pkg.dev

helm push cloudnative-pg-0.23.0.tgz oci://$region-docker.pkg.dev/$artifact_registry_project_id/$artifact_registy_repo/cloudnative-pg

gcloud --project=$artifact_registry_project_id artifacts docker images list $region-docker.pkg.dev/$artifact_registry_project_id/$artifact_registy_repo --include-tags

