#!/bin/bash

OVERRIDE=$1

if [ -z $OVERRIDE ]; then
  echo "Override zipfile required."
  exit -1
fi;

if [ ! -f $OVERRIDE ]; then
  echo "Override zipfile not found: $OVERRIDE"
  exit -1
fi;

rm -rf override
mkdir override

echo =======================
echo Expand override
echo =======================
unzip -d override $OVERRIDE

SECRET_NAME=$(grep secretName override/istioOverride.yaml | awk '{print $2}')
DOMAIN=$(grep external-dns.alpha.kubernetes.io/hostname override/istioOverride.yaml | awk '{print $2}'  | sed 's/.$//g')

./mesh-prepare.sh ${SECRET_NAME} ${DOMAIN}

echo =======================
echo Installing Istio
echo =======================
helm repo up
helm upgrade --install --namespace istio-system istio axway/istio-init
helm upgrade --install --namespace istio-system istio axway/istio -f ./override/istioOverride.yaml

echo =======================
echo Installing Agents
echo =======================
helm upgrade --install --namespace apic-control apic-hybrid axway/apicentral-hybrid -f ./override/hybridOverride.yaml --set observer.enabled=true --set observer.filebeat.sslVerification=none

kubectl get services -n apic-control
kubectl get services -n apic-demo

echo =======================
echo Installing Kiali
echo =======================
bash <(curl -L https://git.io/getLatestKialiOperator)