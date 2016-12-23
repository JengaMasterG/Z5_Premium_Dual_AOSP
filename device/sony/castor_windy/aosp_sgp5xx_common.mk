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
BOARD_COMMON_PATH := device/sony/castor_windy

DEVICE_PACKAGE_OVERLAYS += \
    $(BOARD_COMMON_PATH)/overlay

PRODUCT_COPY_FILES += \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/BCM4339.hcd:system/etc/firmware/BCM43xx.hcd \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/coldboot.patch:/system/etc/tfa98xx/coldboot.patch \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/TFA9890.patch:/system/etc/tfa98xx/TFA9890.patch \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/TFA9890_top.config:/system/etc/tfa98xx/TFA9890_top.config \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/TFA9890_btm.config:/system/etc/tfa98xx/TFA9890_btm.config \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/btm.speaker:/system/etc/tfa98xx/btm.speaker \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/top.speaker:/system/etc/tfa98xx/top.speaker \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeaker_top.preset:/system/etc/tfa98xx/HiFiSpeaker_top.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeaker_btm.preset:/system/etc/tfa98xx/HiFiSpeaker_btm.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeakerRing_top.preset:/system/etc/tfa98xx/HiFiSpeakerRing_top.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeakerRing_btm.preset:/system/etc/tfa98xx/HiFiSpeakerRing_btm.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeakerSforce_top.preset:/system/etc/tfa98xx/HiFiSpeakerSforce_top.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeakerSforce_btm.preset:/system/etc/tfa98xx/HiFiSpeakerSforce_btm.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/VoiceCallSpeaker_top.preset:/system/etc/tfa98xx/VoiceCallSpeaker_top.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/VoiceCallSpeaker_btm.preset:/system/etc/tfa98xx/VoiceCallSpeaker_btm.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/FMSpeaker_top.preset:/system/etc/tfa98xx/FMSpeaker_top.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/FMSpeaker_btm.preset:/system/etc/tfa98xx/FMSpeaker_btm.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeaker_top.eq:/system/etc/tfa98xx/HiFiSpeaker_top.eq \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeaker_btm.eq:/system/etc/tfa98xx/HiFiSpeaker_btm.eq \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeakerRing_top.eq:/system/etc/tfa98xx/HiFiSpeakerRing_top.eq \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeakerRing_btm.eq:/system/etc/tfa98xx/HiFiSpeakerRing_btm.eq \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeakerSforce_top.eq:/system/etc/tfa98xx/HiFiSpeakerSforce_top.eq \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/HiFiSpeakerSforce_btm.eq:/system/etc/tfa98xx/HiFiSpeakerSforce_btm.eq \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/VoiceCallSpeaker_top.eq:/system/etc/tfa98xx/VoiceCallSpeaker_top.eq \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/VoiceCallSpeaker_btm.eq:/system/etc/tfa98xx/VoiceCallSpeaker_btm.eq \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/FMSpeaker_top.eq:/system/etc/tfa98xx/FMSpeaker_top.eq \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/FMSpeaker_btm.eq:/system/etc/tfa98xx/FMSpeaker_btm.eq \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/TFA9890_Receiver.config:/system/etc/tfa98xx/TFA9890_Receiver.config \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/VoiceCallEarpice_top.preset:/system/etc/tfa98xx/VoiceCallEarpice_top.preset \
    $(BOARD_COMMON_PATH)/rootdir/system/etc/tfa98xx/VoiceCallEarpice_top.eq:/system/etc/tfa98xx/VoiceCallEarpice_top.eq

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:system/etc/permissions/android.software.freeform_window_management.xml

PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREBUILT_DPI := hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=240 \
    ro.usb.pid_suffix=1B1

$(call inherit-product, device/sony/shinano/platform.mk)
$(call inherit-product, vendor/sony/shinano-castor/castor-vendor.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
