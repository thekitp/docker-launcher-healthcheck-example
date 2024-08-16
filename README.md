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

The `autoheal` container will restart any container that have label `autoheal-service=true` when the healthcheck fails.
