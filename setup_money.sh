#!/bin/bash

### Microsoft Money 2005 UK Edition ###

# This script will (re)install Microsoft Money under Wine on Linux systems.
# It depends on having a working wine installation and the winetricks script
# Documentation for wine is available at https://www.winehq.org/ 

set -e

# set environment variables
export WINEPREFIX=$HOME/.wine/prefixes/money2005
export WINEARCH=win32

# if the prefix already exists, we should delete it and start afresh
if [[ -d $WINEPREFIX ]]; then
    rm -rvf $WINEPREFIX
fi

# if the .exe is not present locally, we need to download it
EXE=$HOME/Downloads/Money2005-UK-QFE2.exe
if [[ ! -f $EXE ]]; then
    wget -O $EXE http://money.mvps.org/downloads/files/2005/Money2005-UK-QFE2.exe
fi

mkdir -p /home/rob/.wine/prefixes

winecfg -v winxp

# install IE 6 as Money won't run without it
# It is necessary to click through the installer
winetricks -q ie6 corefonts msxml6 

# Fix for dropdown menus
regsvr32 /i browseui.dll
wine $EXE
regedit $HOME/Documents/Money/money14.reg
