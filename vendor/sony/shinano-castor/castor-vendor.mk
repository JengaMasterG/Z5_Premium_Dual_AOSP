PRODUCT_PLATFORM := shinano
$(call inherit-product, vendor/nxp/nxp-vendor.mk)
$(call inherit-product, vendor/qcom/prebuilt/qcom-vendor.mk)
$(call inherit-product, vendor/sony/shinano-common/shinano-partial.mk)
$(call inherit-product, $(LOCAL_PATH)/castor-partial.mk)
