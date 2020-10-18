#!/bin/bash

set -e

#echo "Deploying to pi-kitchen@192.168.2.22..."
#scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@192.168.2.22:~/.docker/config.json
#scp -o StrictHostKeyChecking=no docker-compose.yml pi@192.168.2.22:/home/pi/apps/motion-sensor-reporter/docker-compose.yml
#scp -o StrictHostKeyChecking=no scripts/deployInner.sh pi@192.168.2.22:/home/pi/apps/motion-sensor-reporter/deployInner.sh
#scp -o StrictHostKeyChecking=no scripts/notification.sh pi@192.168.2.22:/home/pi/apps/motion-sensor-reporter/notification.sh
#scp -o StrictHostKeyChecking=no changes pi@192.168.2.22:/home/pi/apps/motion-sensor-reporter/changes
#ssh -o StrictHostKeyChecking=no pi@192.168.2.22 "cd /home/pi/apps/motion-sensor-reporter && ./deployInner.sh"
#echo "Deploying to pi-kitchen@192.168.2.22...DONE"

echo "Deploying to pi-office@192.168.2.21..."
scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@192.168.2.21:~/.docker/config.json
scp -o StrictHostKeyChecking=no docker-compose.yml pi@192.168.2.21:/home/pi/apps/motion-sensor-reporter/docker-compose.yml
scp -o StrictHostKeyChecking=no scripts/deployInner.sh pi@192.168.2.21:/home/pi/apps/motion-sensor-reporter/deployInner.sh
scp -o StrictHostKeyChecking=no scripts/notification.sh pi@192.168.2.21:/home/pi/apps/motion-sensor-reporter/notification.sh
scp -o StrictHostKeyChecking=no changes pi@192.168.2.21:/home/pi/apps/motion-sensor-reporter/changes
scp -o StrictHostKeyChecking=no current_version pi@192.168.2.21:/home/pi/apps/motion-sensor-reporter/current_version
ssh -o StrictHostKeyChecking=no pi@192.168.2.21 "cd /home/pi/apps/motion-sensor-reporter && ./deployInner.sh"
echo "Deploying to pi-office@192.168.2.21...DONE"
