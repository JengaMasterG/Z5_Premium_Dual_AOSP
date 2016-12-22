#
# Copyright (C) 2016 The CyanogenMod Project
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    init_exec.cpp \
    init_files.cpp \
    init_io.cpp \
    init_main.cpp \
    init_ramdisk.cpp \
    ../extract_ramdisk/extract_ramdisk.cpp

LOCAL_C_INCLUDES := \
    ../extract_ramdisk

LOCAL_CPPFLAGS := \
    -Wall \
    -Wextra \
    -Werror

LOCAL_MODULE := init_sony
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_UNSTRIPPED_PATH := $(PRODUCT_OUT)/symbols/utilities

LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES := \
    libbase \
    libc \
    libelf \
    libz

# Flag: FOTA number set
fota_num_set := false

# Board: yukon
ifneq ($(filter yukon,$(PRODUCT_PLATFORM)),)
ifneq ($(filter eagle,$(TARGET_DEVICE)),)
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="22"
fota_num_set := true
endif
ifneq ($(filter flamingo,$(TARGET_DEVICE)),)
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="18"
fota_num_set := true
endif
ifneq ($(filter seagull,$(TARGET_DEVICE)),)
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="21"
fota_num_set := true
endif
ifneq ($(filter tianchi,$(TARGET_DEVICE)),)
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="16"
fota_num_set := true
endif
endif

# Board: rhine
ifneq ($(filter rhine,$(PRODUCT_PLATFORM)),)
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="16"
fota_num_set := true
endif

# Board: shinano
ifneq ($(filter shinano,$(PRODUCT_PLATFORM)),)
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="16"
fota_num_set := true
endif

# Board: kanuti
ifneq ($(filter kanuti,$(PRODUCT_PLATFORM)),)
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="21"
fota_num_set := true
endif

# Board: kitakami
ifneq ($(filter kitakami,$(PRODUCT_PLATFORM)),)
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="32"
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_MAJOR="259"
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_MINOR="0"
fota_num_set := true
endif

# Board: loire
ifneq ($(filter loire,$(PRODUCT_PLATFORM)),)
ifneq ($(filter kugo,$(TARGET_DEVICE)),)
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="46"
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_MAJOR="259"
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_MINOR="14"
fota_num_set := true
else
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="42"
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_MAJOR="259"
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_MINOR="10"
fota_num_set := true
endif
endif

# Board: tone
ifneq ($(filter tone,$(PRODUCT_PLATFORM)),)
ifneq ($(filter kagura,$(TARGET_DEVICE)),)
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="48"
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_MAJOR="259"
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_MINOR="16"
fota_num_set := true
else
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_NUM="45"
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_MAJOR="259"
LOCAL_CFLAGS += -DDEV_BLOCK_FOTA_MINOR="13"
fota_num_set := true
endif
endif

# Abort if the device is not handled
ifneq ($(fota_num_set),true)
$(error device-sony-common-init: DEV_BLOCK_FOTA_NUM missing for "$(TARGET_DEVICE)", platform "$(PRODUCT_PLATFORM)")
endif

# Debug current init_sony settings
$(info device-sony-common-init: init_sony for "$(TARGET_DEVICE)", platform "$(PRODUCT_PLATFORM)", with $(LOCAL_CFLAGS))

# FOTA check is broken on all devices
LOCAL_CFLAGS += -DFOTA_RAMDISK_CHECK="0"

# Ensure keycheck is used on all devices on AOSP
LOCAL_CFLAGS += -DKEYCHECK_ENABLED="1"

# Only use Volume+ on all devices on AOSP
LOCAL_CFLAGS += -DKEYCHECK_NO_DOWN="1"

LOCAL_CLANG := true

include $(BUILD_EXECUTABLE)

root_init      := $(TARGET_ROOT_OUT)/init
root_init_real := $(TARGET_ROOT_OUT)/init.real

	# If /init is a file and not a symlink then rename it to /init.real
	# and make /init be a symlink to /sbin/init_sony (which will execute
	# /init.real, if appropriate.
$(root_init_real): $(root_init) $(PRODUCT_OUT)/utilities/toybox $(PRODUCT_OUT)/utilities/keycheck $(PRODUCT_OUT)/utilities/init_sony
	cp $(PRODUCT_OUT)/utilities/toybox $(TARGET_ROOT_OUT)/sbin/toybox_init
	cp $(PRODUCT_OUT)/utilities/keycheck $(TARGET_ROOT_OUT)/sbin/keycheck
	cp $(PRODUCT_OUT)/utilities/init_sony $(TARGET_ROOT_OUT)/sbin/init_sony
	$(hide) if [ ! -L $(root_init) ]; then \
	  echo "/init $(root_init) isn't a symlink"; \
	  mv $(root_init) $(root_init_real); \
	  ln -s sbin/init_sony $(root_init); \
	else \
	  echo "/init $(root_init) is already a symlink"; \
	fi

ALL_DEFAULT_INSTALLED_MODULES += $(root_init_real)
