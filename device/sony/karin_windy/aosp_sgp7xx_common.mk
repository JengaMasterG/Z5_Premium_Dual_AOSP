# Copyright 2014 The Android Open Source Project
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

# Device path
BOARD_COMMON_PATH := device/sony/karin_windy

TARGET_KERNEL_CONFIG := aosp_kitakami_karin_defconfig

DEVICE_PACKAGE_OVERLAYS += \
    $(BOARD_COMMON_PATH)/overlay

PRODUCT_COPY_FILES += \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/BCM4356.hcd:system/etc/firmware/BCM43xx.hcd \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:system/etc/permissions/android.software.freeform_window_management.xml

PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    ro.usb.pid_suffix=1CF

# Camera actuator selection
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.alt.act=true

$(call inherit-product, device/sony/kitakami/platform.mk)
$(call inherit-product, vendor/sony/kitakami-karin/karin-vendor.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# copy wlan firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4356/device-bcm.mk)
