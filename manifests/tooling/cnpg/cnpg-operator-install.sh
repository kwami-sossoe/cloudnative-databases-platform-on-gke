gcloud container clusters get-credentials $gke_cluster_name --region $region --project $gke_project_id

cd manifests/tooling/cnpg

helm repo add cnpg https://cloudnative-pg.github.io/charts

helm upgrade --install cnpg --namespace cnpg-system --create-namespace cnpg/cloudnative-pg
