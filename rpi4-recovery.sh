#!/system/bin/sh

#
# Copyright (c) 2019-2020 Konsta <konsta09@gmail.com>
#
# This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike
# 4.0 International License. To view a copy of this license, visit
# http://creativecommons.org/licenses/by-nc-sa/4.0/
# or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
#

check_root()
{
  if [ `id -u` != 0 ]; then
    echo "Must be root to run script!"
    exit 1
  fi
}

mount_partitions()
{
  echo "Mounting partitions..."
  mount -o rw,remount /boot
}

change_ramdisk()
{
  if [ -f /boot/ramdisk-recovery.img ] && [ ! -f /boot/ramdisk-boot.img ]; then
    echo "Changing ramdisk..."
    mv /boot/ramdisk.img /boot/ramdisk-boot.img
    mv /boot/ramdisk-recovery.img /boot/ramdisk.img
  else
    echo "Something went wrong!"
    exit 2
  fi
}

restore_ramdisk()
{
  if [ -f /boot/ramdisk-boot.img ] && [ ! -f /boot/ramdisk-recovery.img ]; then
    echo "Restoring ramdisk..."
    mv /boot/ramdisk.img /boot/ramdisk-recovery.img
    mv /boot/ramdisk-boot.img /boot/ramdisk.img
  else
    echo "Something went wrong!"
    exit 2
  fi
}

unmount_partitions()
{
  echo "Unmounting partitions..."
  mount -o ro,remount /boot
}

finish()
{
  echo "Done, reboot device!"
  exit 0
}

if [ -z $1 ] || [ $1 == "recovery" ]; then
  check_root
  mount_partitions
  change_ramdisk
  unmount_partitions
  finish
elif [ $1 == "restore" ] || [ $1 == "boot" ]; then
  check_root
  mount_partitions
  restore_ramdisk
  unmount_partitions
  finish
else
  echo "Usage: rpi4-recovery.sh [recovery|restore|boot]"
fi
