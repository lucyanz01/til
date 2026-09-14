#!/bin/bash 
START_VM="qemu-system-x86_64 -enable-kvm -m 4096 -drive file=/home/luci/debian.qcow2 -display none -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80"

if [ "$1" == "start" ]; then 
echo "Starting virtual machine..."
$START_VM &
echo "Virtual machine started successfully"

elif [ "$1" == "ssh" ]; then 
echo "Connecting to Debian..."
ssh -p 2222 lucixcfg@localhost 

elif [ "$1" == "stop" ]; then
echo "Turning off the virtual machine..."
ssh -p 2222 lucixcfg@localhost "sudo poweroff"

else 
echo  "Try again: ./vm.sh [start|ssh|stop]"
fi

