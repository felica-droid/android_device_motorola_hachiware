#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from cypfr device
$(call inherit-product, device/motorola/hachiware/device-cypfr.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_cypfr
PRODUCT_DEVICE := cypfr
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g52j 5G

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=cypfr_g \
    PRIVATE_BUILD_DESC="cypfr_g-user 12 S3RYBS32M.168-19-5-3 5e11d release-keys"

BUILD_FINGERPRINT := motorola/cypfr_g/cypfr:12/S3RYBS32M.168-19-5-3/5e11d:user/release-keys

# Gapps
#TARGET_USES_MINI_GAPPS := true

# Updater
#TARGET_EXCLUDE_UPDATER := true
