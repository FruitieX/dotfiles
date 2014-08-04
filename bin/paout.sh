#!/bin/bash

# play audio output from remote pulseaudio server locally

REQUESTED_LATENCY=100
DEV=alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00-CODEC.analog-stereo.monitor

until PULSE_SERVER=10.8.0.1 pacat -r --device=$DEV --latency-msec=$REQUESTED_LATENCY | pacat -p --latency-msec=$REQUESTED_LATENCY
do
    echo reconnecting to pulseaudio server...
    sleep 1
done

