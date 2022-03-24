#!/bin/bash
#-------------------------------------#
#         Credit: Kevin Liu           #
#  Built for Quick Deploy NearRTRIC   #
#-------------------------------------#

# U Should clone the repo first!

OPAROOTDIR=/root

sudo apt-get update
sudo apt-get install -y vim git curl net-tools

cd $OPAROOTDIR
git clone https://gerrit.o-ran-sc.org/r/it/dep
cd dep && git submodule update --init --recursive --remote

### Setup K8S
echo "Setting the Kubernetes Node ..........."
sleep 5

cd $OPAROOTDIR/OPAGatekeeper_for_ORAN-main/

sudo chmod +x ./k8s-1node-cloud-init-k_1_21-h_3_8-d_cur.sh
mv -f ./k8s-1node-cloud-init-k_1_21-h_3_8-d_cur.sh  /root/dep/tools/k8s/bin/
cd /root/dep/tools/k8s/bin/
./k8s-1node-cloud-init-k_1_21-h_3_8-d_cur.sh

echo "Set up environment successfully. Wait for 5 Seconds"
sleep 5

### Setup NearRT RIC Environment
cd /root/dep/bin

./deploy-ric-platform -f ~/dep/RECIPE_EXAMPLE/PLATFORM/example_recipe_oran_e_release.yaml

###### It would take an hour to settle it down completely

kubectl get ns 
kubectl get pod -n ricplt 
kubectl get pod -n ricplt  | wc -l

echo "Near-RT RIC Installed Successful!"
echo "[■] Kubernetes Version: v1.21.1"
echo "[■] Helm Version: v3.8.0"
echo "Please enter \"kubectl get pod -n ricplt\" to ensure every pod is in \"Running\" state"
sleep 5

