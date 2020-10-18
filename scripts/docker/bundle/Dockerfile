FROM arm32v7/python:3.9-alpine

# install dependencies
RUN apk update && apk add gcc libc-dev
RUN pip install RPi.GPIO
RUN pip install pynat
RUN apk del gcc libc-dev

RUN mkdir -p /app

ADD movement.py /app/movement.py

WORKDIR /app

CMD [ "python", "movement.py" ]