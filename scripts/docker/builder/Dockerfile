FROM python:3.9-alpine

# builder to be used on amd64 arch

# install dependencies
RUN apk update && apk add gcc libc-dev
RUN pip install RPi.GPIO
RUN apk del gcc libc-dev
