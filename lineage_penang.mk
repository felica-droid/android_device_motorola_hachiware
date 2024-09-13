#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from penang device
$(call inherit-product, device/motorola/hachiware/device-penang.mk)

# Inherit some common Rising stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Rising
RISING_MAINTAINER := lahaina
RISING_CHIPSET := Snapdragon 480 Plus 5G
RISING_PACKAGE_TYPE := GAPPS
WITH_GMS := true
TARGET_CORE_GMS := true
TARGET_CORE_GMS_EXTRAS := true
TARGET_ENABLE_BLUR := true
PRODUCT_NO_CAMERA := false
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_penang
PRODUCT_DEVICE := penang
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g53j 5G

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=penang_g \
    PRIVATE_BUILD_DESC="penang_g-user 14 U1TPS34M.29-83-1 295da release-keys"

BUILD_FINGERPRINT := motorola/penang_g/penang:14/U1TPS34M.29-83-1/295da:user/release-keys
