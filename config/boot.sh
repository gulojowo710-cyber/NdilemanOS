#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Update dan Install paket esensial
apt-get update
apt-get install -y --no-install-recommends \
    xserver-xorg-core \
    xserver-xorg-video-all \
    xinit \
    openbox \
    chromium-browser \
    nodm \
    live-boot \
    systemd-sysv

# Konfigurasi Auto-Login tanpa password menggunakan nodm
cat <<EOF > /etc/default/nodm
NODM_ENABLED=true
NODM_USER=root
NODM_FIRST_VT=7
NODM_XSESSION=/etc/mini-os.kiosk
NODM_X_OPTIONS="-nolisten tcp"
EOF

# Bersihkan cache untuk memperkecil ukuran ISO
apt-get clean
rm -rf /var/lib/apt/lists/*

