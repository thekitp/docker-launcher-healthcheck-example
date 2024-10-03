#!/bin/bash

# Start the first process
python3 -m docker_launcher_healthcheck_example.server --host '127.0.0.1' --port 8081 &

# Start the second process
python3 -m docker_launcher_healthcheck_example.server --host '127.0.0.1' --port 8082 &

# Start the sthird process
python3 -m docker_launcher_healthcheck_example.server --host '127.0.0.1' --port 8083 &

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?