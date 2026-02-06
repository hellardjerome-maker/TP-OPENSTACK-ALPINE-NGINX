#!/bin/sh
set -e

VM_NAME="vm-alpine-nginx"
IMAGE="Alpine-3.21"
FLAVOR="m1.small"
NETWORK="LAN-LABO"

openstack server create \
  --image "$IMAGE" \
  --flavor "$FLAVOR" \
  --network "$NETWORK" \
  --user-data scripts/cloud-init.yaml \
  "$VM_NAME"

