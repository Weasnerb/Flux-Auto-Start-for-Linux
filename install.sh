#!/bin/bash

function checkPrivileges {
    if [[ $(/usr/bin/id -u) -ne 0 ]]; then
        echo "Insufficient privileges"
        exit
    fi
}

function main {
    checkPrivileges
    if ping -q -c 1 -W 1 google.com >/dev/null; then
        changeWorkspace
        installFlux
        installFluxAutostart
        createAutostartDesktopFile
    else
        echo "No Network Connection, Please Connect to the Internet"
    fi
}

function changeWorkspace {
    # Get ScriptPath
    pushd `dirname $0` > /dev/null
    SCRIPTPATH=`pwd`
    popd > /dev/null

    # Change Workspace
    cd ~/Downloads/
}

function installFlux {
    # Download Flux
    wget https://justgetflux.com/linux/xflux64.tgz
    sudo mkdir /usr/local/bin/flux-autostart/
    tar -xvf xflux64.tgz
    rm xflux64.tgz

    # Move Flux
    sudo mv xflux /usr/local/bin/flux-autostart/
}

function installFluxAutostart {
    sudo apt-get install curl -y
    sudo cp -a $SCRIPTPATH/. /usr/local/bin/flux-autostart/
}

function createAutostartDesktopFile {
    echo '[Desktop Entry]
    Type=Application
    Exec=/usr/local/bin/flux-autostart/startFlux.sh
    Icon=/usr/local/bin/flux-autostart/flux.png
    Hidden=false
    NoDisplay=false
    X-GNOME-Autostart-enabled=true
    Name[en_US]=Flux
    Name=Flux
    Comment[en_US]=Start flux with Zip code based on current Ip
    Comment=Start flux with Zip code based on current Ip'  > ~/.config/autostart/f.desktop
}

main