#!/usr/bin/env bash

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi

# CAUTION - setting NAMESPACE will deploy most components to the given namespace
# however some are hardcoded to 'monitoring'. Only use if you have reviewed all manifests.

if [ -z "${NAMESPACE}" ]; then
    NAMESPACE=kube-system
fi

kctl() {
    kubectl --namespace "$NAMESPACE" "$@"
}

# Deploy Traefik RBAC
kctl apply -f traefik-rbac.yml

# Deploy internal Traefik and it's config
kctl $1 -f traefik-configmap.yml
kctl $1 -f traefik-internal-deployment.yml
