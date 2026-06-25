# Setting up a Debian VM with QEMU 

## Environment

- HOST OS: Linux Debian 11
- Virtualization: QEMU
- QEMU version: 5.2.0 (Debian repo version)

## what I did
- Installed QEMU for the first time using official documentation and package tools (dpkg)
- Installed the ISO image of Debian 13 netinst ISO from the official Debian website
- Created the disk image with qemu-img

`qemu-img create -f qcow2 debian.qcow2 20G`

- Booted the debian installer

`qemu-system-x86_64 -m 4096 -cdrom debian-netinst.iso -drive file=debian.qcow2 -boot d -display gtk`


- Completed Debian installation and initial system configuration with CLI
- Started the VM (without installer)

`qemu-system-x86_64 -m 4096 -drive file=debian.qcow2 -display gtk`

## issues I had

- QEMU wouldn't launch, got an error until I realized there was a previous QEMU process still running in the background. Killed it and it worked.
- Had display issues (GTK and SDL not working). Fixed by installing missing dependencies such as qemu-utils and related packages.