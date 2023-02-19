#! /bin/sh
#
# Author:       Thomas Bendler <code@thbe.org>
# Date:         Wed Jun 29 10:12:17 UTC 2022
#
# Note:         To debug the script change the shebang to: /usr/bin/env bash -vx
#
# Prerequisite: This release needs a shell that could handle functions.
#               If shell is not able to handle functions, remove the
#               error section.
#
# Release:      0.1.0
#
# ChangeLog:    v0.1.0 - Initial release
#
# Purpose:      Fix broken RHEL disk layout on 128G OS disk
#

### Fix broken GPT table on /dev/disk/azure/root ###
rm -f /tmp/parted_info
parted --script /dev/disk/azure/root p 2>&1 | tee -a /tmp/parted_info
if grep -Eq 'fix the GPT' /tmp/parted_info; then
  echo -e "Fix\n" | parted ---pretend-input-tty /dev/disk/azure/root print 1>/dev/null
  rm -f /tmp/parted_info
else
  rm -f /tmp/parted_info
  echo "GPT already fixed, exiting!"
  exit 0
fi

### Resizing of /dev/disk/azure/root partition 2 to utilize the remaining free space ###
growpart /dev/disk/azure/root 2

### Display new sizing on /dev/disk/azure/root ###
parted /dev/disk/azure/root print free

### Resize the pyhsical volume on /dev/disk/azure/root-part2 for LVM ###
pvresize /dev/disk/azure/root-part2

### Display resized volume group rootvg ###
vgdisplay rootvg
