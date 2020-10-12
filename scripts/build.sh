#!/bin/bash

set -e

docker build -f scripts/docker/builder/Dockerfile -t atomy/motion-sensor-reporter_builder:latest .
