#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/cezanne/cezanne-vendor.mk)

# Inherit properties
include $(LOCAL_PATH)/properties.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Overlays
PRODUCT_PACKAGES += \
    FrameworkResOverlay \
    FrameworksResTarget \
    DevicesOverlay \
    DevicesAndroidOverlay \
    TetheringConfigOverlay \
    WifiResCommon \
    SettingsOverlay \
    SystemUIOverlay \
    FaceUnlockService

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/xiaomi/cezanne \

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1080

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper \
    tinymix
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libldacBT_dec


# Camera
#ifeq ($(AOSP_GAPPS), true)
#PRODUCT_PACKAGES += \
#    GCamGOPrebuilt
#else
#PRODUCT_PACKAGES += \
#    Snap
#endif

# Camera
PRODUCT_PACKAGES += \
    CameraGo

PRODUCT_COPY_FILES += \
    hardware/interfaces/camera/provider/2.4/default/android.hardware.camera.provider@2.4-service_64.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init/android.hardware.camera.provider@2.4-service_64.rc

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    lineage.biometrics.fingerprint.inscreen@1.0-service.kona

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6885:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6885

# Gboard
PRODUCT_PACKAGES += \
    Gboard

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# HotwordEnrollement
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IFAA manager
PRODUCT_PACKAGES += \
    org.ifaa.android.manager

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
    $(LOCAL_PATH)/keylayout/ACCDET_cen.kl:system/usr/keylayout/ACCDET_cen.kl

# Lights
PRODUCT_PACKAGES += \
    lights.cezanne

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag \
    SecureElement

# Parts
PRODUCT_PACKAGES += \
    XiaomiParts

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.cezanne \
    vendor.qti.hardware.perf@2.0

# Ramdisk
PRODUCT_PACKAGES += \
    init.qcom.post_boot.sh \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.safailnet.rc \
    setup_MTK_In-Call_volume_adjust.sh \
    init.mtkincalladj.rc

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-qti.xml

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-wfd.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-wfd.xml
