import RPi.GPIO as GPIO
import time
from datetime import datetime

now = datetime.now()
dateTime = now.strftime("%Y-%m-%d %H:%M:%S")
print("[{}] Starting up...".format(dateTime))

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
