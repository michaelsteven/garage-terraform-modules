#!/usr/bin/env bash

kubectl create namespace tekton-pipelines
kubectl apply --filename https://github.com/tektoncd/dashboard/releases/download/v0.2.1/dashboard-latest-release.yaml


