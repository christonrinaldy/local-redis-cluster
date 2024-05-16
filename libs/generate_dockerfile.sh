#!/bin/bash
# Check if start port and end port arguments are provided
if [ $# -lt 2 ]; then
  echo "Usage: $0 <start_port> <end_port>"
  exit 1
fi

start_port=$1
end_port=$2

if [ $((end_port - start_port)) -lt 5 ]; then
    echo "Error: Need at least 6 ports to create a redis cluster"
    exit 1
fi

# Create the Dockerfile
echo "# Use the official Redis image as the base image" > Dockerfile
echo "FROM redis" >> Dockerfile
echo "" >> Dockerfile

# Copy the Redis configuration files for each node
echo "# Copy the Redis configuration files for each node" >> Dockerfile
echo "COPY redis_instances_configs/* /usr/local/etc/redis/" >> Dockerfile
echo "" >> Dockerfile

# Copy the start script
echo "# Copy the start script" >> Dockerfile
echo "COPY libs/cmd-start.sh /usr/local/bin/start.sh" >> Dockerfile
echo "" >> Dockerfile

# Expose the necessary ports
echo "# Expose the necessary ports" >> Dockerfile
echo "EXPOSE ${start_port}:${end_port}" >> Dockerfile
echo "" >> Dockerfile

# Set the CMD
echo "# Set the CMD" >> Dockerfile
echo 'CMD [ "start.sh" ]' >> Dockerfile

# Display the generated Dockerfile
cat Dockerfile
