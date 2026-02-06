#!/bin/bash
# Vérification des paramètres
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 VM_NAME"
  exit 1
fi

VM_NAME=$1
IMAGE="alpine"
FLAVOR="m1.tiny"
NETWORK="LAN-LABO"
USER_DATA="scripts/cloud-init.yaml

if openstack server list | grep -q "$VM_NAME"; then
  echo "La VM existe déjà !"
  exit 0
fi

USER_DATA="scripts/cloud-init.yaml"

openstack server create \
  --image "$IMAGE" \
  --flavor "$FLAVOR" \
  --network "$NETWORK" \
  --user-data "$USER_DATA" \
  "$VM_NAME"

openstack server wait "$VM_NAME"
IP=$(openstack server show "$VM_NAME" -f value -c addresses | grep -oP '\d+\.\d+\.\d+\.\d+')

echo "La VM $VM_NAME est déployée avec IP : $IP"
