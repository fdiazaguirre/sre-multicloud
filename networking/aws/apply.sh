#!/bin/bash

# Initialize Terraform
terraform init

# Apply the Terraform configuration
# Pass the AWS region as a variable
if [ -z "$1" ]
then
  terraform apply -auto-approve
else
  terraform apply -auto-approve -var "aws_region=$1" -var "username=$2"
fi

# Save the username provided as an argument to a variable
username=${2:-test}

# Save the name of the created VPC to a variable
vpc_name=$(terraform output -raw vpc_name)

# Save the VPC name to a text file with the username in the file name
echo "$vpc_name" > "vpc_${username}.txt"