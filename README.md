# VFIO scripts

These files are meant to live in `/etc/libvirt/hooks`. The `qemu` file acts as the "entrypoint", routing to the various machines and phases in `qemu.d`. In this example, the virtual machine is named `win11`, though this is customizable. All PCIe addresses are illustrative, and should be updated for your machine.

These scripts, specifically, are optimized for a machine with both a 3090, and an A4000. The goal of these scripts was to detach the 3090 from the nvidia driver, while allowing the A4000 to stay fully controlled by the closed-source nvidia driver. Unfortunately, the nvidia driver is temporarily unloaded during domain startup, and may cause hiccups if the secondary GPU is being actively used during that time. 

