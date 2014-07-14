#!/bin/bash

PULSE_SERVER=localhost gst-launch-0.10 pulsesrc device=alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00-CODEC.analog-stereo.monitor ! opusenc cbr=true bitrate=192000 dtx=false inband-fec=false ! oggmux ! shout2send ip=10.8.0.1 port=8000 username=source password=source mount=/stream

