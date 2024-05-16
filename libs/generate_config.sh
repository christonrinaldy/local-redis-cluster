# Check if start and end ports are provided as arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 <start_port> <end_port>"
    exit 1
fi

# Extract start and end ports from arguments
start_port=$1
end_port=$2

# Check if the difference between end and start port is less than 5
if [ $((end_port - start_port)) -lt 5 ]; then
    echo "Error: Need at least 6 ports to create a redis cluster"
    exit 1
fi

# Assign the start and end ports from the command-line arguments
START_PORT=$1
END_PORT=$2

# Define the base filename for the configuration files
BASE_FILENAME="redis_node"

rm -rf redis_instances_configs
mkdir redis_instances_configs

# Loop through the range of ports
for (( port=$START_PORT; port<=$END_PORT; port++ ))
do
    # Define the filename for the current port
    CONFIG_FILE="redis_instances_configs/${BASE_FILENAME}_${port}.conf"
    
    # Define the content of the configuration file
    CONFIG_CONTENT="port $port\n"
    CONFIG_CONTENT+="cluster-enabled yes\n"
    CONFIG_CONTENT+="cluster-config-file nodes_${port}.conf\n"
    
    # Echo the content to the configuration file
    echo -e "$CONFIG_CONTENT" > "$CONFIG_FILE"
    
    # Output success message
    echo "Configuration file '$CONFIG_FILE' created successfully."
done