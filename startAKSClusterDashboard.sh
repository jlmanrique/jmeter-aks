export NODES=4
export LOCATION=eastus
export RESOURCE_GROUP=akstesting2
export CLUSTER_NAME=mytestcluster2
export REPLICAS=15
export NAMESPACE=jmeter

cd jmeter-kubernetes
./dashboard.sh
kubectl scale deployment jmeter-slaves --namespace=$NAMESPACE --replicas=$REPLICAS
