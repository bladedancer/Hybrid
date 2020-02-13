#!/bin/sh

helm delete --purge istio
helm delete --purge apic-hybrid
kubectl delete ns apic-control apic-demo istio-system