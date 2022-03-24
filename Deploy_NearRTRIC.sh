#!/bin/bash
#-------------------------------------#
#         Credit: Kevin Liu           #
#  Built for Quick Deploy NearRTRIC   #
#-------------------------------------#

sudo apt-get update
sudo apt-get install -y vim git curl net-tools

git clone https://gerrit.o-ran-sc.org/r/dep
cd dep && git submodule update --init --recursive --remote

### Setup K8S
echo "Setting the Kubernetes Node ..........."
sleep 5

git clone https://github.com/leozzmc/OPAGatekeeper_for_ORAN.git K8s_Setup

cd K8s_Setup
sudo chmod +x ./k8s-1node-cloud-init-k_1_21-h_3_8-d_cur.sh
./k8s-1node-cloud-init-k_1_21-h_3_8-d_cur.sh

echo "Set up environment successfully. Wait for Pods Running"
sleep 10
while [[$(kubectl get pod -n kube-system | wc -1) -ne 9]]  # It should have 9 entries
do
  echo "Wait for Pod to run."
  sleep 5
done

### Setup NearRT RIC Environment
cd ~/dep/bin

./deploy-ric-platform -f ../RECIPE_EXAMPLE/PLATFORM/example_recipe_oran_e_release.yaml

###### It would take an hour to settle it down completely

kubectl get ns 
kubectl get pod -n ricplt 
kubectl get pod -n ricplt  | wc -l

echo "Near-RT RIC Installed Successful!"















echo "[■] Kubernetes Version: v1.21.1"
echo "[■] Helm Version: v3.8.0"
sleep 5

