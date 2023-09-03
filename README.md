# Seatunnel in Codespaces

```
cd /workspaces/seatunnel-demo/seatunnel/flink
docker build -t seatunnel:2.3.0-flink-1.13 -f Dockerfile .
k3d image import seatunnel:2.3.0-flink-1.13
kubectl create -f https://github.com/jetstack/cert-manager/releases/download/v1.8.2/cert-manager.yaml
helm repo add flink-operator-repo https://downloads.apache.org/flink/flink-kubernetes-operator-1.6.0/
helm install flink-kubernetes-operator flink-operator-repo/flink-kubernetes-operator --set image.repository=apache/flink-kubernetes-operator
cd /workspaces/seatunnel-demo/seatunnel
wget https://raw.githubusercontent.com/apache/seatunnel/2.3.0-release/config/v2.streaming.conf.template -O seatunnel.streaming.conf
kubectl create cm seatunnel-config --from-file=seatunnel.streaming.conf=seatunnel.streaming.conf
kubectl apply -f seatunnel-flink.yaml
kubectl logs -f deploy/seatunnel-flink-streaming-example
```
