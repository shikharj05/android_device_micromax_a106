$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/micromax/a106/a106-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/micromax/a106/overlay

LOCAL_PATH := device/micromax/a106
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \

#rootfs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/fstab:root/fstab \
    $(LOCAL_PATH)/recovery/root/fstab.mt6582:root/fstab.mt6582

#SELinux
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/file_contexts:root/file_contexts \
    $(LOCAL_PATH)/recovery/root/seapp_contexts:root/seapp_contexts \
    $(LOCAL_PATH)/recovery/root/property_contexts:root/property_contexts

#twrp
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_NAME := full_a106
PRODUCT_DEVICE := a106

PRODUCT_COPY_FILES_OVERRIDES += \
    root/fstab.goldfish \
    root/init.goldfish.rc \
    root/uventd.goldfish.rc \
    recovery/root/fstab.goldfish \
    recovery/root/uventd.goldfish.rc \
   

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=1 \
persist.mtk.aee.aed=on \
ro.debuggable=1 \
persist.service.acm.enable=0 \
persist.sys.usb.config=mass_storage \
ro.bootloader.mode=download \
ro.mount.fs=EXT4 \
ro.persist.partition.support=no

$(call inherit-product, build/target/product/full.mk)
