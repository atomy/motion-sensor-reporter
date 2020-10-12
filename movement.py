import RPi.GPIO as GPIO
import time

print("Starting up...")

GPIO.setmode(GPIO.BCM)
GPIO.setup(23, GPIO.IN) # PIR sensor

print("GPIO setup complete")

try:
    time.sleep(2) # to stabilize sensor
    motion = False
    print("Entering endless-loop...")

    while True:
        if GPIO.input(23):
            if False == motion:
                motion = True
                print("Motion (first) Detected...")
        else:
            print("No motion")
            motion = False

        time.sleep(0.05) #loop delay

except Exception as e:
    print("Exception! Exiting...")
    print(e)
    GPIO.cleanup()
