#!/bin/bash

clear
echo "Installing extra tools..."

sudo apt update

# advanced configuration tools
sudo apt install -y gconf-editor compizconfig-settings-manager

# restricted extras
sudo apt install -y flashplugin-installer \
  ubuntu-restricted-extras

# monitors
sudo apt install -y conky \
  curl \
  lm-sensors \
  hddtemp \
  wireshark \
  indicator-multiload \
  powertop

# codecs
sudo apt install -y ffmpeg \
  gxine \
  libdvdread4 \
  icedax \
  tagtool \
  libdvd-pkg \
  easytag \
  id3tool \
  lame \
  libxine2-ffmpeg \
  nautilus-script-audio-convert \
  libmad0 \
  mpg321 \
  libavcodec-extra \
  gstreamer1.0-libav

echo "Done."
