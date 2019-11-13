#!/usr/bin/env bash

if [[ -z "${TMP_DIR}" ]]; then
    TMP_DIR=".tmp"
fi

YAML_FILE=${TMP_DIR}/tekton.yaml

echo "apiVersion: operators.coreos.com/v1alpha1" > ${YAML_FILE}
echo "kind: Subscription" >> ${YAML_FILE}
echo "metadata:" >> ${YAML_FILE}
echo "  name: tekton" >> ${YAML_FILE}
echo "  namespace: openshift-operators" >> ${YAML_FILE}
echo "spec:" >> ${YAML_FILE}
echo "  channel: dev-preview" >> ${YAML_FILE}
echo "  name: openshift-pipelines-operator" >> ${YAML_FILE}
echo "  source: community-operators" >> ${YAML_FILE}
echo "  sourceNamespace: openshift-marketplace" >> ${YAML_FILE}

echo "*** creating tekton openshift-pipelines-operator"
kubectl apply -f ${YAML_FILE}