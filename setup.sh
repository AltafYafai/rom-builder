#!/bin/bash
# Copyright (C) 2019 baalajimaestro
#
# Licensed under the Raphielscape Public License, Version 1.b (the "License");
# you may not use this file except in compliance with the License.
#

echo "***Build Bot***"
echo $TELEGRAM_TOKEN >/tmp/tg_token
echo $TELEGRAM_CHAT >/tmp/tg_chat
echo $GITHUB_TOKEN > /tmp/gh_token
echo $DRONE_BUILD_NUMBER > /tmp/build_no

sudo echo "ci ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
useradd -m -d /home/ci ci
useradd -g ci wheel
sudo cp github-release /usr/bin
sudo cp telegram /usr/bin
DEBIAN_FRONTEND=noninteractive sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo curl -sL -o/var/cache/apt/archives/openjdk-8-jre_8u45-b14-1_amd64.deb http://old-releases.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jre_8u45-b14-1_amd64.deb
DEBIAN_FRONTEND=noninteractive sudo dpkg -i /var/cache/apt/archives/openjdk-8-jre_8u45-b14-1_amd64.deb
DEBIAN_FRONTEND=noninteractive sudo curl -sL -o/var/cache/apt/archives/openjdk-8-jdk_8u45-b14-1_amd64.deb http://old-releases.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jdk_8u45-b14-1_amd64.deb
DEBIAN_FRONTEND=noninteractive sudo dpkg -i /var/cache/apt/archives/openjdk-8-jdk_8u45-b14-1_amd64.deb
DEBIAN_FRONTEND=noninteractive sudo apt-get -f install
DEBIAN_FRONTEND=noninteractive sudo update-alternatives --config java
DEBIAN_FRONTEND=noninteractive sudo update-alternatives --config javac
sudo -Hu ci bash -c "bash build.sh"
