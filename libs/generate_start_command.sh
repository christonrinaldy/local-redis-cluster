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

# Function to generate Redis instance start script
generate_start_script() {
  start_script="./libs/cmd-start.sh"
  cat > "$start_script" <<EOF
#!/bin/bash

# Run Redis instances
EOF

  # Loop through the range of ports and add commands to start Redis instances
  for port in $(seq $start_port $end_port); do
    echo "redis-server /usr/local/etc/redis/redis_node_${port}.conf &" >> "$start_script"
  done

  # Add command to keep the script running to keep the container alive
  echo "tail -f /dev/null" >> "$start_script"

  # Make the script executable
  chmod +x "$start_script"
}

# Generate Redis instance start script
generate_start_script
