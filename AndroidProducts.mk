#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_penang.mk \
    $(LOCAL_DIR)/lineage_cypfr.mk

COMMON_LUNCH_CHOICES := \
    lineage_penang-user \
    lineage_penang-userdebug \
    lineage_penang-eng

COMMON_LUNCH_CHOICES += \
    lineage_cypfr-user \
    lineage_cypfr-userdebug \
    lineage_cypfr-eng
