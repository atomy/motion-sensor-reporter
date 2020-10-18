import RPi.GPIO as GPIO
import time
import json
from datetime import datetime
from pynats import NATSClient

class event:
    def __init__(self, hostname="unknown", version="0.0.0"):
        self.action = "motion"
        self.hostname = hostname
        self.timestamp = int(time.time()) * 1000
        self.emitter_version = version

now = datetime.now()
dateTime = now.strftime("%Y-%m-%d %H:%M:%S")
print("[{}] Starting up...".format(dateTime))

with open('hostname', 'r') as file:
    hostname = file.read().replace('\n', '')

with open('current_version', 'r') as file:
    currentVersion = file.read().replace('\n', '')

GPIO.setmode(GPIO.BCM)
GPIO.setup(23, GPIO.IN) #PIR

print("[{}] GPIO setup complete".format(dateTime))

try:
    time.sleep(2) # to stabilize sensor
    motion = False

    now = datetime.now()
    dateTime = now.strftime("%Y-%m-%d %H:%M:%S")
    print("[{}] Entering endless-loop...".format(dateTime))

    while True:
        now = datetime.now()
        dateTime = now.strftime("%Y-%m-%d %H:%M:%S")

        if GPIO.input(23):
            if not motion:
                motion = True
                print("[{}] Motion (first) Detected...".format(dateTime))

                event1 = event(hostname, currentVersion)

                with NATSClient("nats://192.168.2.20:4222") as client:
                    jsonString = json.dumps(event1.__dict__)
                    print('[{}] Sending "{}" to NATS!'.format(dateTime, jsonString))
                    client.publish("motion", payload=jsonString)

        else:
            print("[{}] No motion".format(dateTime))
            motion = False

        time.sleep(0.05) #loop delay

except Exception as e:
    now = datetime.now()
    dateTime = now.strftime("%Y-%m-%d %H:%M:%S")
    print("[{}] Exception! Exiting...".format(dateTime))
    print(e)
    GPIO.cleanup()
