export NODES=4
export LOCATION=eastus
export RESOURCE_GROUP=akstesting2
export CLUSTER_NAME=mytestcluster2
export REPLICAS=15
export NAMESPACE=jmeter

# Inicio sesion
az.cmd login

# Creacion del Cluster
az.cmd group create --name $RESOURCE_GROUP --location $LOCATION
az.cmd aks create --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME --node-count $NODES --enable-addons monitoring --generate-ssh-keys
az.cmd aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME

# Ejecucion de la infraestructura
cd jmeter-kubernetes
./jmeter_cluster_create.sh
