#!/bin/bash
# Vérification des paramètres
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <nom_de_la_vm>"
  exit 1
fi
VM_NAME=$1
IMAGE="alpine"
FLAVOR="m1.tiny"
NETWORK="LAN-LABO"
KEY_NAME="default"
# Vérifie si la VM existe déjà
if openstack server list | grep -q "$VM_NAME"; then
  echo "La VM existe déjà !"
  exit 0
fi
# Création de la VM
openstack server create \
  --image "$IMAGE" \
  --flavor "$FLAVOR" \
  --network "$NETWORK" \
  "$VM_NAME"
# Attente que la VM soit active et récupération de l'IP
openstack server wait "$VM_NAME"
IP=$(openstack server show "$VM_NAME" \
     -f value -c addresses | cut -d= -f2)
echo "La VM $VM_NAME est déployée avec IP : $IP"
