#!/bin/bash

UDEVFILE="/etc/udev/rules.d/99-arcticfox.rules"
GROUP="arcticfox"

echo "creating group $GROUP"
groupadd $GROUP

echo "creating $UDEVFILE"

cat > $UDEVFILE << EOF
# HIDAPI/libusb
SUBSYSTEM=="usb", ATTRS{idVendor}=="0416", ATTRS{idProduct}=="5020", GROUP="$GROUP", MODE="0660"

# HIDAPI/hidraw
KERNEL=="hidraw*", ATTRS{busnum}=="1", ATTRS{idVendor}=="0416", ATTRS{idProduct}=="5020", GROUP="$GROUP", MODE="0660"
EOF

echo "to get access to the arcticfox device add your user to the group $GROUP"
