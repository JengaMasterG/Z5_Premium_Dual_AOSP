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

TARGET_KERNEL_CONFIG := aosp_shinano_scorpion_defconfig

PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only

# Device Init
PRODUCT_PACKAGES += \
    init.recovery.scorpion_windy \
    init.scorpion_windy \
    ueventd.scorpion_windy

# Lights
PRODUCT_PACKAGES += \
    lights.scorpion_windy

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.scorpion_windy

# NFC config
PRODUCT_PACKAGES += \
    nfc_nci.scorpion_windy

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/scorpion_windy/aosp_sgp6xx_common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

PRODUCT_NAME := aosp_sgp611
PRODUCT_DEVICE := scorpion_windy
PRODUCT_MODEL := Xperia Z3 Tablet Compact WiFi(AOSP)
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
