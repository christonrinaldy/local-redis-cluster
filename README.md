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

<iframe src="https://drive.google.com/file/d/1hUhipUzLrz6tEW1RTFgR7vT4qDFV13CR/preview" width="640" height="480" allow="autoplay"></iframe>

![alt text](https://drive.google.com/file/d/1LaNfWxU2LW_TNgRlW43D4G8TS8A98-aM/view?usp=sharing)

![alt text](https://drive.google.com/file/d/1ay_SDjFL2chngRgq6L7pek55pyYeHbMJ/view?usp=sharing)