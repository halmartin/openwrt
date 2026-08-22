DTS_DIR := $(DTS_DIR)/fsl

define Device/adtran_ad3040
  DEVICE_VENDOR := Adtran
  DEVICE_MODEL := AD3040
  DEVICE_DTS := adtran-ad3040
  DEVICE_PACKAGES := \
	kmod-eeprom-at24 kmod-hwmon-ina2xx kmod-phy-aquantia
  KERNEL := kernel-bin | libdeflate-gzip | fit gzip $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb
  KERNEL_SUFFIX := -fit-uImage.itb
  IMAGES := sysupgrade.bin
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += adtran_ad3040
