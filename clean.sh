#!/bin/bash

# Function to delete a directory if it exists
delete_directory() {
  if [ -d "$1" ]; then
    sudo rm -rf "$1"
    echo "Folder '$1' telah dihapus."
  else
    echo "Folder '$1' tidak ada."
  fi
}

# List of directories to delete
directories=(
  "/home/bdata/bigdata-file/mongodb/"
)

# Loop through the list and delete each directory if it exists
for dir in "${directories[@]}"; do
  delete_directory "$dir"
done