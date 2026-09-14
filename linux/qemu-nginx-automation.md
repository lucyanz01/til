# QEMU Setup with NGINX Port Forwarding and Bash Automation

## QEMU Basic Command
qemu-system-x86_64 -m 4096 -drive file=~/debian.qcow2 -display gtk -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::2222-:22

## Headless Mode
I learned to run the VM without the QEMU window by adding -display none and & at the end of the command.

qemu-system-x86_64 -enable-kvm -m 4096 -drive file=/home/luci/debian.qcow2 -display none -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80 &

## ED25519 SSH Keys
I used ED25519 asymmetric cryptography for machine-to-machine authentication:

ssh-keygen -t ed25519
ssh-copy-id -p 2222 lucixcfg@localhost

## Visudo Configuration
To allow sudo poweroff without password:
lucixcfg ALL=(ALL) NOPASSWD: /usr/sbin/poweroff 
