#!/bin/bash
echo "checking arguments..."
# Parse arguments
create-container=false  # Set default value for create-fcontainer
for arg in "$@"; do
    case "$arg" in
        --create-container=*)
            create-container="${arg#*=}"
            ;;
        *)
            echo "Unknown argument: $arg"
            exit 1
            ;;
    esac
done

echo "create-container: $create-container"

export create-container