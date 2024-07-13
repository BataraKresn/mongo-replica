#!/bin/bash

NETWORK_NAME="mongo-cluster"
if network_exists "$NETWORK_NAME"; then
  echo "Network $NETWORK_NAME already exists."
else
  echo "Creating network $NETWORK_NAME..."
  docker network create "$NETWORK_NAME"
fi

# Function to create a directory if it doesn't exist
create_directory() {
  if [ -d "$1" ]; then
    echo "Folder '$1' sudah ada."
  else
    sudo mkdir -p "$1"
    echo "Folder '$1' telah dibuat."
  fi
}

# List of directories to create
directories=(
  "/home/bdata/bigdata-file/mongodb/mongo1_data"
  "/home/bdata/bigdata-file/mongodb/mongo2_data"
  "/home/bdata/bigdata-file/mongodb/mongo3_data"
  "/home/bdata/bigdata-file/mongodb/mongo1_config"
  "/home/bdata/bigdata-file/mongodb/mongo2_config"
  "/home/bdata/bigdata-file/mongodb/mongo3_config"
)

# Loop through the list and create each directory if needed
for dir in "${directories[@]}"; do
  create_directory "$dir"
done

# Change ownership and permissions
sudo chown airflow:root -R /home/bdata/bigdata-file/mongodb/
echo "Ownership is done."

sudo chmod -R 777 /mongodb/
