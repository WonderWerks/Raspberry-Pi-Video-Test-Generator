#!/bin/bash
# Unified video/image display player. Single persistent mpv instance,
# controlled entirely via IPC. Mode switching (video <-> images) means
# loading a different playlist over the socket -- this process never
# restarts for that. Defaults to looping the video folder on boot.

SOCKET=/tmp/vtg-display.sock
rm -f "$SOCKET"

exec mpv --idle=yes \
    --keep-open=yes \
    --input-ipc-server="$SOCKET" \
    --fullscreen \
    --no-osc \
    --no-osd-bar \
    --osd-level=3 \
    --hwdec=auto \
    --vo=gpu \
    --profile=gpu-hq \
    --scale=bilinear \
    --cscale=bilinear \
    --dscale=bilinear \
    --video-sync=display-resample \
    --audio-device=alsa/hdmi:CARD=vc4hdmi1,DEV=0 \
    --image-display-duration=5 \
    --loop-playlist=inf \
    --quiet \
    --msg-level=vo=error \
    ~/vtg_gen2/media/video/*