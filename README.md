# docker-launcher-healthcheck-example

Example of how to use the `entrypoint.sh` to launch multiple process in a container with `healthcheck.sh` script for healthcheck condition.
And restart the container if the healthcheck fails.

## Usage

## start the container
```bash
docker compose up -d
```
## watch the status of the container
```bash
watch docker compose ps
```

## access the server-1 REST API from another container
```bash
docker run --rm --network container:server-1 curlimages/curl:latest -L -v http://localhost:8081
```

The `autoheal` container will restart any container that have label `autoheal-service=true` when the healthcheck fails.
