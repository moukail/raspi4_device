LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := GoogleOneTimeInitializer
LOCAL_MODULE_CLASS := APPS
#LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PACKAGE_NAME := GoogleServicesFramework
LOCAL_PRIVILEGED_MODULE := true
LOCAL_DEX_PREOPT := true

# The priv-app folder
#TARGET_OUT_DATA_APPS_PRIVILEGED := $(TARGET_OUT_DATA)/priv-app

include $(BUILD_PREBUILT)