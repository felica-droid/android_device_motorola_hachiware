#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/cypfr

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := cypfr

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=cypfr
TARGET_KERNEL_CONFIG := vendor/cypfr_defconfig

# Partitions
BOARD_USERDATAIMAGE_PARTITION_SIZE := 102247673856

BOARD_PRODUCTIMAGE_PARTITION_SIZE := 2121900032
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_SYSTEM_EXTIMAGE_PARTITION_SIZE := 805306368

BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 6613893120 # ((SUPER_PARTITION_SIZE / 2) - 4194304)
BOARD_SUPER_PARTITION_SIZE := 107079512064

# inherit from the proprietary version
include vendor/motorola/cypfr/BoardConfigVendor.mk

include device/motorola/hachiware/BoardConfigCommon.mk
