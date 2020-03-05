export NODES=4
export RESOURCE_GROUP=akstesting2
export LOCATION=eastus
export CLUSTER_NAME=mytestcluster2

az group delete --name $RESOURCE_GROUP --yes --no-wait
