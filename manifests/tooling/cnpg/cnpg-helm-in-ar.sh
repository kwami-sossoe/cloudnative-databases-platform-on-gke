export region=europe-west1 
export gke_hub_project_id=ops-152437-anthos-dv
export artifact_registry_project_id=cloud-insights-data-lab
export clustername=cloud-native-db-prod-cluster
export artifact_registy_repo=cndb-registry

cd /home/iac/dev-charm/skwailab-accelerator/cloud-native-databases/db-helm-charts/

helm package cloudnative-pg-helm/charts/cluster/

gcloud --project=$artifact_registry_project_id auth print-access-token | helm registry login -u oauth2accesstoken --password-stdin https://$region-docker.pkg.dev

helm push cluster-0.0.9.tgz oci://$region-docker.pkg.dev/$artifact_registry_project_id/$artifact_registy_repo/cluster

gcloud --project=$artifact_registry_project_id artifacts docker images list $region-docker.pkg.dev/$artifact_registry_project_id/$artifact_registy_repo --include-tags

