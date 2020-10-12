#!/bin/bash

set -e

echo "Running inner deployment..."
docker-compose pull
docker-compose up -d
./notification.sh
echo "Running inner deployment...DONE"