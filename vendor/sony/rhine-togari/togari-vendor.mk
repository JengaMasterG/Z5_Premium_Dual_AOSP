PRODUCT_PLATFORM := rhine
$(call inherit-product, vendor/qcom/prebuilt/qcom-vendor.mk)
$(call inherit-product, vendor/sony/rhine-common/rhine-partial.mk)
$(call inherit-product, $(LOCAL_PATH)/togari-partial.mk)
