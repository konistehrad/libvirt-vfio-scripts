#!/bin/bash

## Load the config file
source "/etc/libvirt/hooks/win11.conf"

## Unload nvidia
modprobe -r nvidia_drm
modprobe -r nvidia_modeset

## Unbind gpu from vfio
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO

## Refresh modules
modprobe nvidia_drm modeset=1 # implicitly brings nvidia_modeset back
nvidia-smi -i 0 -pl 350 # reset power limit for 3090


