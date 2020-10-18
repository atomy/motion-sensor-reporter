#!/bin/bash

set -e

echo "Running inner deployment..."
echo `hostname` > ./hostname
docker-compose pull
docker-compose up -d
./notification.sh
echo "Running inner deployment...DONE"