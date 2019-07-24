#!/bin/bash

# write commands if you want to clone some repos
mkdir .repo/local_manifests
curl https://raw.githubusercontent.com/moto-msm8937-common/local_manifests/staging/lineage-15.1/perry-lineage-15.1.xml -o .repo/local_manifests/perry-lineage-15.1.xml > /dev/null 2>&1
repo sync --force-sync --current-branch --no-tags --no-clone-bundle --optimized-fetch --prune -j$(nproc --all) -q device/motorola/perry device/motorola/msm8937-common vendor/motorola/perry vendor/motorola/msm8937-common kernel/motorola/msm8937 2>&1 >>logwe 2>&1
