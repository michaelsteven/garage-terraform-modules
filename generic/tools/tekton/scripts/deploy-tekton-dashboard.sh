#!/usr/bin/env bash

if [[ -z "${TMP_DIR}" ]]; then
    TMP_DIR=".tmp"
fi

echo "*** Waiting for Tekton CRDs to be available"
until oc get crd tasks.tekton.dev
do
    echo '>>> waiting for tekton crd availability'
    sleep 30
done
echo '>>> Tekton has crds are available'

kubectl create namespace tekton-pipelines
kubectl apply --filename https://github.com/tektoncd/dashboard/releases/download/v0.2.1/dashboard-latest-release.yaml


