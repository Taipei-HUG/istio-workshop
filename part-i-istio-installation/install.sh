#!/bin/sh

helm repo add istio.io https://storage.googleapis.com/istio-release/releases/1.3.2/charts/

kubectl apply -f helm-service-account.yaml

helm init --service-account tiller

helm upgrade --install istio-init --namespace istio-system istio.io/istio-init --wait

helm upgrade --install istio --namespace istio-system -f istio-customized.yaml istio.io/istio --wait

kubectl apply -f addons

kubectl label namespace default istio-injection=enabled --overwrite=true
