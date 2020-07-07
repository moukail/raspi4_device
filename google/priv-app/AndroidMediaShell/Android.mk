LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := AndroidMediaShell
LOCAL_MODULE_CLASS := APPS
#LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := com.google.android.apps.mediashell.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PACKAGE_NAME := AndroidMediaShell
LOCAL_PRIVILEGED_MODULE := true
LOCAL_DEX_PREOPT := true

include $(BUILD_PREBUILT)