#!/bin/bash

if [ $(kubectl get nodes -oname | wc -l) = "1" ]; then
  echo "Elimiate pod resource requests"

  source $(dirname "${BASH_SOURCE[0]}")/cert-manager-install.sh

  fats_retry kubectl apply -f https://storage.googleapis.com/projectriff/no-resource-requests-webhook/no-resource-requests-webhook.yaml
  wait_pod_selector_ready app=webhook no-resource-requests
fi
