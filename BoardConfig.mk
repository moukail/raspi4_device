#
# Copyright 2020 Android-RPi Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_NO_BOOTLOADER := true
#TARGET_NO_KERNEL := true
#TARGET_NO_RECOVERY := true

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a72
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_USES_64_BIT_BINDER := true

PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current

TARGET_BOARD_PLATFORM := bcm2711

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1605306368 # 768M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 134217728 # 128M

TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE := 134217728 # 128M
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_FLASH_BLOCK_SIZE := 4096

MALLOC_SVELTE := true

USE_XML_AUDIO_POLICY_CONF := 1

BOARD_GPU_DRIVERS := v3d
BOARD_USES_DRM_GRALLOC := true
USE_OPENGL_RENDERER := true
TARGET_USES_HWC2 := true
TARGET_SCREEN_DENSITY := 213

TARGET_ENABLE_MEDIADRM_64 := true

# TWRP
RECOVERY_VARIANT := twrp
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_USERIMAGES_USE_EXT4 := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_THEME := landscape_mdpi
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_MTP := true
TW_HAS_NO_BOOT_PARTITION := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_NO_SCREEN_TIMEOUT := true
TW_NO_BATT_PERCENT := true

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211

USE_CAMERA_STUB := true

BOARD_SEPOLICY_DIRS := device/moukafih/raspi4/sepolicy

DEVICE_MANIFEST_FILE := device/moukafih/raspi4/manifest.xml

TARGET_PREBUILT_KERNEL := kernel/rpi/arch/arm/boot/zImage

recoveryramdisk: $(call build-recoveryramdisk)