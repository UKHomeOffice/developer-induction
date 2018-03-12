#!/usr/bin/env bash

set -o errexit
set -o nounset

# default values
export DRONE_DEPLOY_TO=${DRONE_DEPLOY_TO:?'[error] Please specify which cluster to deploy to.'}
export KUBE_NAMESPACE=${KUBE_NAMESPACE=developer-induction}
export KUBE_SERVER="https://kube-api-notprod.notprod.acp.homeoffice.gov.uk"
export KUBE_TOKEN=${KUBE_TOKEN}

echo "--- kube api url: ${KUBE_SERVER}"
echo "--- namespace: ${KUBE_NAMESPACE}"

echo "--- downloading ca for kube api"
if ! curl --silent --fail --retry 5 \
    https://raw.githubusercontent.com/UKHomeOffice/acp-ca/master/acp-notprod.crt -o /tmp/ca.crt; then
  echo "[error] failed to download ca for kube api"
  exit 1
fi

echo "--- deploying hello world application"
if ! kd --certificate-authority=/tmp/ca.crt \
  --namespace=${KUBE_NAMESPACE} \
  --timeout=5m \
  -f kube/example-networkpolicy.yaml \
  -f kube/example-service.yaml \
  -f kube/example-deployment.yaml \
  -f kube/example-ingress.yaml; then
  echo "[error] failed to deploy hello world application"
  exit 1
fi
