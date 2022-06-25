#!/bin/sh
ls /tmp/emulated_tpm
exec qemu-system-x86_64 \ 
-hda /home/windows11-iso/windows11.img \
-device -drive file=/home/windows11-iso/windows11.img,if=virtio \
-boot d -cdrom /home/windows11-iso/windows11.iso \
-boot g -cdrom /home/windows11-iso/virtio-win.iso'
-chardev socket,id=chrtpm,path=/tmp/emulated_tpm/swtpm-sock \
-tpmdev emulator,id=tpm0,chardev=chrtpm \
-device tpm-tis,tpmdev=tpm0 \
-net nic,model=virtio \
-cpu host -smp 4,cores=2 -m 8192 \
