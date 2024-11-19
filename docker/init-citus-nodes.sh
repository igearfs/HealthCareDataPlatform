#!/bin/bash

# Wait for the PostgreSQL master node to be ready
echo "Waiting for PostgreSQL master to be ready..."
until pg_isready -h dhp-postgres-master -p 5432 -U dhp-postgres; do
  echo "Waiting for dhp-postgres-master..."
  sleep 5
done

# Wait for the worker nodes to be ready
echo "Waiting for PostgreSQL worker nodes to be ready..."
until pg_isready -h dhp-postgres-node1 -p 5432 -U dhp-postgres; do
  echo "Waiting for dhp-postgres-node1..."
  sleep 5
done

until pg_isready -h dhp-postgres-node2 -p 5432 -U dhp-postgres; do
  echo "Waiting for dhp-postgres-node2..."
  sleep 5
done

echo "All PostgreSQL containers are ready!"

# Adding worker nodes to Citus cluster
echo "Adding worker nodes to the Citus cluster..."
psql -h dhp-postgres-master -U dhp-postgres -d postgres -c "SELECT citus.add_node('dhp-postgres-node1', 5432);"
psql -h dhp-postgres-master -U dhp-postgres -d postgres -c "SELECT citus.add_node('dhp-postgres-node2', 5432);"

# Verify the Citus cluster nodes
psql -h dhp-postgres-master -U dhp-postgres -d postgres -c "SELECT * FROM pg_dist_node;"

echo "Citus cluster initialization completed!"
