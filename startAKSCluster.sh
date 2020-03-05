export NODES=4
export LOCATION=eastus
export RESOURCE_GROUP=akstesting2
export CLUSTER_NAME=mytestcluster2
export REPLICAS=15
export NAMESPACE=jmeter

# Inicio sesion
az login

# Creacion del Cluster
az group create --name $RESOURCE_GROUP --location $LOCATION
az aks create --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME --node-count $NODES --enable-addons monitoring --generate-ssh-keys
az aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME

# Ejecucion de la infraestructura
cd jmeter-kubernetes
./jmeter_cluster_create.sh

# wait

./dashboard.sh
kubectl scale deployment jmeter-slaves --namespace=$NAMESPACE --replicas=$REPLICAS
