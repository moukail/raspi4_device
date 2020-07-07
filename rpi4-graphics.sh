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
  mount -o rw,remount /system
}

swiftshader_properties()
{
  echo "Changing properties for SwiftShader..."
  sed -i 's/^dtoverlay=vc4-kms-v3d/#dtoverlay=vc4-kms-v3d/' /boot/config.txt
  sed -i 's/^max_framebuffers=2/#max_framebuffers=2/' /boot/config.txt
  sed -i 's/^debug.drm.mode.force=1280x720/#debug.drm.mode.force=1280x720/' /system/build.prop
  sed -i 's/^hwc.drm.device=\/dev\/dri\/card1/#hwc.drm.device=\/dev\/dri\/card1/' /system/build.prop
  sed -i 's/^debug.hwui.use_partial_updates=0/#debug.hwui.use_partial_updates=0/' /system/build.prop
  sed -i 's/^#persist.sys.ui.hw=disable/persist.sys.ui.hw=disable/' /system/build.prop
  sed -i 's/^ro.hardware.gralloc=minigbm/#ro.hardware.gralloc=minigbm/' /system/build.prop
  sed -i 's/^ro.hardware.hwcomposer=drm_minigbm/#ro.hardware.hwcomposer=drm_minigbm/' /system/build.prop
}

mesa_properties()
{
  echo "Changing properties for MESA..."
  sed -i 's/^#dtoverlay=vc4-kms-v3d/dtoverlay=vc4-kms-v3d/' /boot/config.txt
  sed -i 's/^#max_framebuffers=2/max_framebuffers=2/' /boot/config.txt
  sed -i 's/^#debug.drm.mode.force=1280x720/debug.drm.mode.force=1280x720/' /system/build.prop
  sed -i 's/^#hwc.drm.device=\/dev\/dri\/card1/hwc.drm.device=\/dev\/dri\/card1/' /system/build.prop
  sed -i 's/^#debug.hwui.use_partial_updates=0/debug.hwui.use_partial_updates=0/' /system/build.prop
  sed -i 's/^persist.sys.ui.hw=disable/#persist.sys.ui.hw=disable/' /system/build.prop
  sed -i 's/^#ro.hardware.gralloc=minigbm/ro.hardware.gralloc=minigbm/' /system/build.prop
  sed -i 's/^#ro.hardware.hwcomposer=drm_minigbm/ro.hardware.hwcomposer=drm_minigbm/' /system/build.prop
}

unmount_partitions()
{
  echo "Unmounting partitions..."
  mount -o ro,remount /system
  mount -o ro,remount /boot
}

finish()
{
  echo "Done, reboot device!"
  exit 0
}

if [ ! -z $1 ] && [ $1 == "swiftshader" ]; then
  check_root
  mount_partitions
  swiftshader_properties
  unmount_partitions
  finish
elif [ ! -z $1 ] && [ $1 == "mesa" ]; then
  check_root
  mount_partitions
  mesa_properties
  unmount_partitions
  finish
else
  echo "Usage: rpi4-graphics.sh swiftshader|mesa"
fi
