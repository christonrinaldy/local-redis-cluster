# Local Redis Cluster
Redis Cluster Setup: Automate creation of clustered Redis instances for scalable and highly available distributed data storage.

**Prerequisites**

* Make sure you have Docker installed and running on your local PC.

**How to Use**

1. Run the script from the project's root directory: `./start.sh <start_port> <end_port> [...args]`

**Available Arguments**

* `--create-container=false` (boolean, default: `false`)

**Example**

* `./start.sh 6379 6384 --create-container=true`

**Notes**

* To establish a Redis cluster, at least 6 Redis instances are required.
* Make sure the difference between `end_port` and `start_port` is at least 5.

![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)