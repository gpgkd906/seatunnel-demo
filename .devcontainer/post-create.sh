#!/bin/bash

# this runs at Codespace creation - not part of pre-build

echo "post-create start"
echo "$(date)    post-create start" >> "$HOME/status"

# update the repos
kubectl create -f https://github.com/jetstack/cert-manager/releases/download/v1.8.2/cert-manager.yaml
sleep 10
helm repo add flink-operator-repo https://downloads.apache.org/flink/flink-kubernetes-operator-1.6.0/
kubectl create cm seatunnel-config --from-file=seatunnel/seatunnel.streaming.conf
sleep 10
helm install flink-kubernetes-operator flink-operator-repo/flink-kubernetes-operator --set image.repository=apache/flink-kubernetes-operator

echo "post-create complete"
echo "$(date +'%Y-%m-%d %H:%M:%S')    post-create complete" >> "$HOME/status"
