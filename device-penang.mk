#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/motorola/hachiware/hachiware.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1200
TARGET_SCREEN_WIDTH := 720

# Screen
TARGET_SCREEN_DENSITY := 280

# AAPT
PRODUCT_AAPT_PREF_CONFIG := 280dpi

# Enable Virtual A/B
TARGET_IS_VAB := true

# Felica
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/penang/configs/felica_sb,$(TARGET_COPY_OUT_PRODUCT)/etc/felica_sb)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResPenang \
    LineageSystemUIPenang \
    LineageSettingsPenang \
    SettingsProviderResPenang \
    SystemUIResPenang \
    EuiccOverlayPenang \
    RegulatoryInfoOverlayPenang

PRODUCT_PACKAGES += \
    FrameworksResPenangSB \
    SettingsProviderResPenangSB \
    RegulatoryInfoOverlayPenangSB

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/penang/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/penang/configs/idc/uinput-fpsensor.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpsensor.idc \
    $(LOCAL_PATH)/penang/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/penang/configs/keylayout/uinput-fpsensor.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpsensor.kl

# Init
$(foreach f,$(wildcard $(LOCAL_PATH)/penang/rootdir/etc/init/hw/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/penang/rootdir/etc/init/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/penang/rootdir/bin/*.sh),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/bin/$(notdir $f)))

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/penang/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

include device/motorola/hachiware/hachiware.mk

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/penang/penang-vendor.mk)
