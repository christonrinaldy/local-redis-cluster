chmod +x libs/generate_config.sh libs/generate_dockerfile.sh libs/generate_start_command.sh libs/check_docker.sh

start_port=$1
end_port=$2


# Check if start port and end port arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <start_port> <end_port>"
  exit 1
fi

if [ $((end_port - start_port)) -lt 5 ]; then
    echo "Error: Need at least 6 ports to create a redis cluster"
    exit 1
fi

./libs/check_docker.sh
./libs/generate_config.sh "${start_port}" "${end_port}"
./libs/generate_dockerfile.sh "${start_port}" "${end_port}"
./libs/generate_start_command.sh "${start_port}" "${end_port}"

docker build -f Dockerfile . -t local-redis-cluster