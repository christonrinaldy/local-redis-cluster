
start_port=$1
end_port=$2

command="docker exec -t local-redis-cluster redis-cli --cluster create"

for ((port=$start_port; port<=$end_port; port++)); do
  command="$command 127.0.0.1:$port"
done

command="$command --cluster-replicas 1 --cluster-yes"

echo $command

docker run -d -p "${start_port}"-"${end_port}:${start_port}"-"${end_port}" --name local-redis-cluster local-redis-cluster
$command