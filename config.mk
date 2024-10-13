#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/fortune-extras/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/fortune-extras/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/fortune-extras/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += vendor/fortune-extras/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images \
    product_charger_res_images_vendor

# Fonts
PRODUCT_COPY_FILES += \
    vendor/fortune-extras/fonts/GoogleSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Regular.ttf \
    vendor/fortune-extras/fonts/GoogleSans-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Italic.ttf \
    vendor/fortune-extras/fonts/GoogleSansClock-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSansClock-Regular.ttf \
    vendor/fortune-extras/fonts/GoogleSansFlex-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSansFlex-Regular.ttf \
    vendor/fortune-extras/fonts/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# Gapps
$(call inherit-product, vendor/gms/products/gms.mk)

# Google Photos Pixel Exclusive XML
PRODUCT_COPY_FILES += \
    vendor/fortune-extras/prebuilt/common/etc/sysconfig/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2016_exclusive.xml

# Overlays
PRODUCT_PACKAGES += \
    CertifiedPropsOverlay \
    FrameworksOverlay \
    SettingsOverlay \
    SystemUIOverlay

PRODUCT_COPY_FILES += \
    vendor/fortune-extras/overlay/partition_order.xml:$(TARGET_COPY_OUT_PRODUCT)/overlay/partition_order.xml \
    vendor/fortune-extras/overlay/config-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/overlay/config/config.xml

# ThemeIcons
$(call inherit-product, vendor/google/overlays/ThemeIcons/config.mk)
