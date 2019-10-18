#!/bin/bash

D=${0%/*}
T=$(mktemp -d)
trap 'rm -rf $T' EXIT

mkfifo "$T/freertos.in"
mkfifo "$T/freertos.out"
ln -s  "$T/freertos.in" "$T/linux.out"
ln -s  "$T/freertos.out" "$T/linux.in"

qemu-system-arm -M versatilepb -nographic -m 128 \
	-kernel "$D/freertos/image.bin" \
	-serial "pipe:$T/freertos" &
FREERTOS=$!

qemu-system-arm -M vexpress-a9 \
	-kernel "$D/linux/boot/zImage" \
	-initrd "$D/linux/boot/initramfs.cpio.gz" \
	-append "console=tty1" -dtb "$D/linux/boot/vexpress-v2p-ca9.dtb" \
	-serial vc -serial "pipe:$T/linux"

kill $FREERTOS
