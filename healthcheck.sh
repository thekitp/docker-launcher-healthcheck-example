#!/usr/bin/env bash

# exit if a command fails
set -ex

# check if the server is healthy
curl --fail-with-body http://localhost:8081/healthcheck

curl --fail-with-body http://localhost:8082/healthcheck

curl --fail-with-body http://localhost:8083/healthcheck