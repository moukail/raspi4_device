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

change_properties()
{
  echo "Changing properties..."
  sed -i 's/^#audio_pwm_mode=2/audio_pwm_mode=2/' /boot/config.txt
  sed -i 's/^#disable_audio_dither=1/disable_audio_dither=1/' /boot/config.txt
  sed -i 's/^#hdmi_ignore_edid_audio=1/hdmi_ignore_edid_audio=1/' /boot/config.txt
}

restore_properties()
{
  echo "Restoring properties..."
  sed -i 's/^audio_pwm_mode=2/#audio_pwm_mode=2/' /boot/config.txt
  sed -i 's/^disable_audio_dither=1/#disable_audio_dither=1/' /boot/config.txt
  sed -i 's/^hdmi_ignore_edid_audio=1/#hdmi_ignore_edid_audio=1/' /boot/config.txt
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

if [ -z $1 ]; then
  check_root
  mount_partitions
  change_properties
  unmount_partitions
  finish
elif [ $1 == "restore" ]; then
  check_root
  mount_partitions
  restore_properties
  unmount_partitions
  finish
else
  echo "Usage: rpi4-audio-jack.sh [restore]"
fi
