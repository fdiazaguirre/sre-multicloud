#!/bin/bash

# Prompt the user for the file name
read -p "Enter the file name: " file_name

# Read the VPC name from the file
target=$(cat "$file_name")

echo "Destroying $target"

terraform destroy -target="aws_vpc.main" -var="vpc_name=$target" -auto-approve
