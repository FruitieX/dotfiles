#!/bin/bash

REQUESTED_LATENCY=100

until PULSE_SERVER=10.8.0.1 pacat -r --device=alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00-CODEC.analog-stereo.monitor --latency-msec=$REQUESTED_LATENCY | pacat -p --latency-msec=$REQUESTED_LATENCY
do
    echo reconnecting to pulseaudio server...
    sleep 1
done

