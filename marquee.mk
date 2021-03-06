$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/marquee/marquee-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/marquee/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/marquee/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Recovery Files
PRODUCT_COPY_FILE += \
    device/lge/marquee/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh 

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_marquee
PRODUCT_DEVICE := marquee
