ifneq ($(filter yukon rhine shinano kanuti kitakami loire tone,$(PRODUCT_PLATFORM)),)

LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

endif
