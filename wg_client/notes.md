# WG Client


## Usage

sudo docker build . -t wg_client


docker run -e "env_var_name=another_value"

docker run --cap-add NET_ADMIN -v $(pwd)/data:/data -e src_cidr="10.66.66.2" -e dest_cidr="10.66.66.1" -e srv_addr="172.17.0.2" wg_client

docker run --cap-add NET_ADMIN -v $(pwd)/data:/data -e src_cidr="10.66.66.2" -e dest_cidr="10.66.66.1" -e srv_addr="172.17.0.2" wg_client

## Description

Creates a docker container that opens a wg connection to the server
