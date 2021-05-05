#
# Copyright (C) 2017 The Android Open Source Project
# Copyright (C) 2017 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/motorola/potter

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 vmalloc=350M androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
$(BOARD_CUSTOM_BOOTIMG_MK , device/motorola/potter/mkbootimg.mk)
TARGET_CUSTOM_DTBTOOL := dtbTool_moto
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image.gz
#KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin/
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-androidkernel-
TARGET_KERNEL_CONFIG := potter_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/potter

LZMA_RAMDISK_TARGETS := recovery


# Platform
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506

# Assert
TARGET_OTA_ASSERT_DEVICE := potter


# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216        #    16384 * 1024 mmcblk0p37
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432    #    16484 * 1024 mmcblk0p38
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296    #  4194304 * 1024 mmcblk0p53
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25614597120 # 25014255 * 1024 mmcblk0p54


# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Crypto
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw

# TWRP Configuration
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_EXTRA_LANGUAGES := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
