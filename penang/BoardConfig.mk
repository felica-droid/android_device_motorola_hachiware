#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/penang

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := penang

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=penang
TARGET_KERNEL_CONFIG := vendor/penang_defconfig

# Partitions
BOARD_USERDATAIMAGE_PARTITION_SIZE := 102247673856

BOARD_PRODUCTIMAGE_PARTITION_SIZE := 2121900032
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1044381696
BOARD_SYSTEM_EXTIMAGE_PARTITION_SIZE := 780140544

BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 4961861632 # ((SUPER_PARTITION_SIZE / 2) - 4194304)
BOARD_SUPER_PARTITION_SIZE := 4966055936

# inherit from the proprietary version
include vendor/motorola/penang/BoardConfigVendor.mk

include device/motorola/hachiware/BoardConfigCommon.mk
