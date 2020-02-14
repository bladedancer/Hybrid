#!/bin/sh

helm delete --purge istio
helm delete --purge apic-hybrid
helm delete --purge brief
kubectl delete ns apic-control apic-demo istio-system kiali-operator demo