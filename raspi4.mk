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

USE_OEM_TV_APP := true
$(call inherit-product, device/google/atv/products/atv_base.mk)

PRODUCT_NAME := raspi4
PRODUCT_DEVICE := raspi4
PRODUCT_BRAND := moukafih
PRODUCT_MANUFACTURER := ARPi
PRODUCT_MODEL := Raspberry Pi 4

include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

# Boot Animation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bootanimation.zip:system/media/bootanimation.zip \
    $(LOCAL_PATH)/google/permissions/com.google.android.tv.installed.xml:system/etc/permissions/com.google.android.tv.installed.xml \
    $(LOCAL_PATH)/google/permissions/privapp-permissions-atv.xml:system/etc/permissions/privapp-permissions-atv.xml \
    $(LOCAL_PATH)/google/permissions/privapp-permissions-google.xml:system/etc/permissions/privapp-permissions-google.xml \
    $(LOCAL_PATH)/google/sysconfig/google.xml:system/etc/sysconfig/google.xml \
    $(LOCAL_PATH)/google/sysconfig/google_build.xml:system/etc/sysconfig/google_build.xml \
    $(LOCAL_PATH)/google/sysconfig/google_atv.xml:system/etc/sysconfig/google_atv.xml \
    $(LOCAL_PATH)/google/sysconfig/google-hiddenapi-package-whitelist.xml:system/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
    $(LOCAL_PATH)/init.myscript.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.myscript.sh

# debug.drm.mode.force=1280x720
PRODUCT_PROPERTY_OVERRIDES += \
    gralloc.drm.device=/dev/dri/card0 \
    gralloc.drm.kms=/dev/dri/card1 \
    ro.opengles.version=196609 \
    wifi.interface=wlan0

# application packages
PRODUCT_PACKAGES += \
    AndroidMediaShell \
    AndroidPlatformServicesTV \
    AndroidTVCoreServices \
    AtvCustomization \
    AtvRemoteService \
    ConfigUpdater \
    GoogleBackupTransport \
    GoogleOneTimeInitializer \
    GooglePartnerSetup \
    SetupWraithPrebuilt \
    GoogleServicesFramework \
    PrebuiltGmsCorePano \
    Tubesky \
    TV \
    TVLauncher \
    TVRecommendations \
    Katniss \
    Overscan \
    RecommendationsService \
    RemoteControlService

#    GoogleExtServices \    GooglePackageInstaller \    LeanbackLauncher \

# application packages
PRODUCT_PACKAGES += \
    AtvWidget \
    Backdrop \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter \
    GoogleExtShared \
    LandscapeWallpaper \
    LeanbackIme \
    talkback \
    WebViewGoogle

# application packages
#PRODUCT_PACKAGES += \
    GooglePermissionController \
    NetworkStackPermissionStub \
    TestApp \
    YouTubeLeanback \
    SssAuthbridgePrebuilt \
    External Storage \
    GoogleTTS \
    DrmProvider \
    Downloads

# system packages
PRODUCT_PACKAGES += \
    libGLES_mesa \
    gralloc.rpi4 \
    memtrack.rpi4 \
    gatekeeper.rpi4 \
    audio.primary.rpi4 \
    audio.usb.default \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_supplicant.conf

# Bluetooth
#PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service \
    android.hardware.bluetooth@1.0-service.rc \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

# Prevent hwui from overloading hwcomposer.drm: remove when drm_hwc is fixed
#PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_partial_updates=0

# hardware/interfaces
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-service.rpi4 \
    android.hardware.graphics.mapper@2.0-impl.rpi4 \
    android.hardware.graphics.composer@2.1-service.rpi4 \
    android.hardware.camera.provider@2.4-external-service.rpi4 \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.health@2.0-service \
    android.hardware.health@2.0-impl \
    android.hardware.wifi@1.0-service \
    android.hardware.configstore@1.1-service \
    vndservicemanager

# system configurations
PRODUCT_COPY_FILES := \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.camera.external.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.external.xml \
    $(LOCAL_PATH)/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml \
    $(LOCAL_PATH)/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/init.rpi4.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi4.rc \
    $(LOCAL_PATH)/init.rpi4.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi4.usb.rc \
    $(LOCAL_PATH)/ueventd.rpi4.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    $(LOCAL_PATH)/fstab.rpi4:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.rpi4 \
    $(LOCAL_PATH)/fstab.rpi4:$(TARGET_COPY_OUT_RAMDISK)/fstab.rpi4 \
    $(LOCAL_PATH)/Generic.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43455-sdio.bin:root/lib/firmware/brcm/brcmfmac43455-sdio.bin \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43455-sdio.bin:$(TARGET_COPY_OUT_RAMDISK)/lib/firmware/brcm/brcmfmac43455-sdio.bin \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43455-sdio.clm_blob:root/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43455-sdio.clm_blob:$(TARGET_COPY_OUT_RAMDISK)/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43455-sdio.txt:root/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43455-sdio.txt:$(TARGET_COPY_OUT_RAMDISK)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt \
    $(LOCAL_PATH)/firmware/brcm/BCM4345C0.hcd:$(TARGET_COPY_OUT_VENDOR)/firmware/brcm/BCM4345C0.hcd \
    $(LOCAL_PATH)/lib/hw/gralloc.rpi.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/gralloc.rpi.so \
    $(LOCAL_PATH)/lib/hw/hwcomposer.rpi.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/hwcomposer.rpi.so \
    $(LOCAL_PATH)/lib/mediadrm/libwvdrmengine.so:$(TARGET_COPY_OUT_VENDOR)/lib/mediadrm/libwvdrmengine.so \
    $(PRODUCT_COPY_FILES)

# DRM HAL
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    #android.hardware.drm@1.0-service \
    android.hardware.drm@1.2-service.clearkey \
    android.hardware.drm@1.2-service.widevine

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    media.mediadrmservice.enable=true

# widevine
# $(LOCAL_PATH)/widevine/bin/hw/android.hardware.drm@1.0-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.drm@1.0-service
# $(LOCAL_PATH)/widevine/bin/hw/android.hardware.drm@1.2-service.clearkey:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.drm@1.2-service.clearkey
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/widevine/bin/hw/android.hardware.drm@1.2-service.widevine:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.drm@1.2-service.widevine \
    $(LOCAL_PATH)/widevine/android.hardware.drm@1.2-service.widevine.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.drm@1.2-service.widevine.rc \
    $(LOCAL_PATH)/widevine/lib/libdrmfs.so:$(TARGET_COPY_OUT_VENDOR)/lib/libdrmfs.so \
    $(LOCAL_PATH)/widevine/lib/libdrmtime.so:$(TARGET_COPY_OUT_VENDOR)/lib/libdrmtime.so \
    $(LOCAL_PATH)/widevine/lib/libdrmutils.so:$(TARGET_COPY_OUT_VENDOR)/lib/libdrmutils.so \
    $(LOCAL_PATH)/widevine/firmware/widevine.b00:$(TARGET_COPY_OUT_VENDOR)/firmware/widevine.b00 \
    $(LOCAL_PATH)/widevine/firmware/widevine.b01:$(TARGET_COPY_OUT_VENDOR)/firmware/widevine.b01 \
    $(LOCAL_PATH)/widevine/firmware/widevine.b02:$(TARGET_COPY_OUT_VENDOR)/firmware/widevine.b02 \
    $(LOCAL_PATH)/widevine/firmware/widevine.b03:$(TARGET_COPY_OUT_VENDOR)/firmware/widevine.b03 \
    $(LOCAL_PATH)/widevine/firmware/widevine.b04:$(TARGET_COPY_OUT_VENDOR)/firmware/widevine.b04 \
    $(LOCAL_PATH)/widevine/firmware/widevine.b05:$(TARGET_COPY_OUT_VENDOR)/firmware/widevine.b05 \
    $(LOCAL_PATH)/widevine/firmware/widevine.b06:$(TARGET_COPY_OUT_VENDOR)/firmware/widevine.b06 \
    $(LOCAL_PATH)/widevine/firmware/widevine.b07:$(TARGET_COPY_OUT_VENDOR)/firmware/widevine.b07 \
    $(LOCAL_PATH)/widevine/firmware/widevine.mdt:$(TARGET_COPY_OUT_VENDOR)/firmware/widevine.mdt

# media configurations
PRODUCT_COPY_FILES := \
    device/generic/goldfish/camera/media_profiles.xml:system/etc/media_profiles.xml \
    device/generic/goldfish/camera/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    frameworks/base/data/sounds/effects/ogg/Effect_Tick_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Effect_Tick.ogg \
    frameworks/base/data/sounds/effects/ogg/camera_click_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/camera_click.ogg \
    $(PRODUCT_COPY_FILES)

DEVICE_PACKAGE_OVERLAYS := device/moukafih/raspi4/overlay
PRODUCT_AAPT_PREF_CONFIG := tvdpi
PRODUCT_CHARACTERISTICS := tv

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
