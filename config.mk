#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Gapps
$(call inherit-product, vendor/gms/products/gms.mk)

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/fortune-extras/overlay/common
