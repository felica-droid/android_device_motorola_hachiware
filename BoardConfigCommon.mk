#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from motorola sm6375-common
include device/motorola/sm6375-common/BoardConfigCommon.mk

HACHIWARE_PATH := device/motorola/hachiware

# Kernel - Prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true

BOARD_KERNEL_BINARIES := kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)-kernel/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)-kernel/dtb.img
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)-kernel/dtb.img:$(TARGET_COPY_OUT)/dtb.img \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/ramdisk-modules/,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/vendor-modules/,$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules)

BOARD_VENDOR_KERNEL_MODULES := \
    $(wildcard $(DEVICE_PATH)-kernel/vendor-modules/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)-kernel/vendor-modules/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)-kernel/vendor-modules/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)-kernel/ramdisk-modules/modules.load))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

INLINE_KERNEL_BUILDING := true

# Properties
TARGET_SYSTEM_PROP += $(HACHIWARE_PATH)/system.prop
TARGET_VENDOR_PROP += $(HACHIWARE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90
TARGET_RECOVERY_DEVICE_DIRS += $(HACHIWARE_PATH)

# Init
TARGET_INIT_VENDOR_LIB := //$(HACHIWARE_PATH):init_hachiware
TARGET_RECOVERY_DEVICE_MODULES := init_hachiware

# HIDL
DEVICE_MANIFEST_FILE += $(HACHIWARE_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(HACHIWARE_PATH)/device_framework_matrix.xml

# Security
VENDOR_SECURITY_PATCH := 2023-06-01
