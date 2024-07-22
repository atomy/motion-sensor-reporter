```
docker run -it -v "$(pwd)/hostname:/app/hostname" -v "$(pwd)/current_version:/app/current_version" --device /dev/gpiomem xxx.dkr.ecr.eu-central-1.amazonaws.com/atomy/motion-sensor-reporter:latest
```