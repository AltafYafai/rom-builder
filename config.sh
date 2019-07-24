#!/bin/bash

GITHUB_USER=flagersgit
GITHUB_EMAIL=flagersmail@gmail.com

KBUILD_BUILD_USER="flagersgit"
KBUILD_BUILD_HOST="bob"

export device=perry

ROM="LineageOS"
manifest_url="https://github.com/LineageOS/android"
export rom_vendor_name="lineage" # This represent the nams used by different rom vendors, Ex - aosp_harpia-userdebug, aosp is vendor name.
branch="lineage-15.1"

release_repo="flagersgit/build_output"

timezone="America/New_York"
