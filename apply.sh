#!/bin/bash

# Debug
set -x

# Set namespace
NAMESPACE="erpnext"
RELEASE_NAME="frappe-bench"

# Check if Helm is installed
# if ! command -v helm &> /dev/null; then
#     echo "Helm is not installed. Please install Helm to use this script."
#     exit 1
# fi

# Check if the current directory contains a Helm chart
if [ ! -f Chart.yaml ]; then
    echo "No Helm chart found in the current directory."
    exit 1
fi

# # Delete everything
# kubectl delete ns erpnext

# # Create required namespace
# kubectl create namespace erpnext 

# Apply the Helm chart in the specified namespace
helm upgrade --install $RELEASE_NAME . --namespace $NAMESPACE
