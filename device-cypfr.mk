#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/motorola/hachiware/hachiware.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Screen
TARGET_SCREEN_DENSITY := 420

# AAPT
PRODUCT_AAPT_PREF_CONFIG := 420dpi

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResCypfr \
    LineageSystemUICypfr \
    LineageSettingsCypfr \
    SettingsProviderResCypfr \
    SystemUIResCypfr \
    EuiccOverlayCypfr \
    RegulatoryInfoOverlayCypfr

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/cypfr/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/cypfr/configs/idc/uinput-fpsensor.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpsensor.idc \
    $(LOCAL_PATH)/cypfr/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/cypfr/configs/keylayout/uinput-fpsensor.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpsensor.kl

# Assistant key
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/cypfr/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# Init
$(foreach f,$(wildcard $(LOCAL_PATH)/cypfr/rootdir/etc/init/hw/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/cypfr/rootdir/etc/init/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/cypfr/rootdir/bin/*.sh),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/bin/$(notdir $f)))

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/cypfr/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/cypfr/cypfr-vendor.mk)
