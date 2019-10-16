#!/usr/bin/env bash

NAMESPACE="$1"
INGRESS_HOST="$2"
DATABASE_TYPE="$3"
DATABASE_NAME="$4"


NAMESPACE="$1"
STORAGE_CLASS="$2"
VOLUME_CAPACITY="$3"


oc new-app postgresql-persistent -n "${NAMESPACE}" \
 -p POSTGRESQL_USER="postgres" \
 -p POSTGRESQL_PASSWORD="postgres" \
 -p POSTGRESQL_DATABASE="postgres" \
 -p VOLUME_CAPACITY="${VOLUME_CAPACITY}"
