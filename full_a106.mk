# Full base
$(call inherit-product, device/micromax/a106/device_a106.mk)

# Needed stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Configure as xhdpi device to prevent breaa106 without mdpi drawables
PRODUCT_AAPT_CONFIG := normal mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi


LOCAL_PATH := device/micromax/a106

PRODUCT_NAME := full_a106
PRODUCT_DEVICE := a106
PRODUCT_BRAND := micromax
PRODUCT_MODEL := A106
