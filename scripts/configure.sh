#!/usr/bin/env bash

set -e

if [ -z "${ECR_PREFIX}" ] ; then
  echo "ENV: ECR_PREFIX is missing!"
  exit 1
fi

if [ -z "${APP_NAME}" ] ; then
  echo "ENV: APP_NAME is missing!"
  exit 1
fi

if [ -z "${DISCORD_WEBHOOK_URL}" ] ; then
  echo "ENV: DISCORD_WEBHOOK_URL is missing!"
  exit 1
fi

rm -f scripts/buildApp.sh
rm -f scripts/push.sh
rm -f docker-compose.yml

cp docker-compose.yml.dist docker-compose.yml
sed -i "s|xxx.dkr.ecr.eu-central-1.amazonaws.com|${ECR_PREFIX}|" docker-compose.yml

cp scripts/buildApp.sh.dist scripts/buildApp.sh
sed -i "s|xxx.dkr.ecr.eu-central-1.amazonaws.com|${ECR_PREFIX}|" scripts/buildApp.sh

cp scripts/push.sh.dist scripts/push.sh
sed -i "s|xxx.dkr.ecr.eu-central-1.amazonaws.com|${ECR_PREFIX}|" scripts/push.sh

cp scripts/notification.sh.dist scripts/notification.sh
sed -i "s|<app-name>|${APP_NAME}|" scripts/notification.sh
sed -i "s|<discord-webhoook-url>|${DISCORD_WEBHOOK_URL}|" scripts/notification.sh
