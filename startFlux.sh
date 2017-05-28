#!/bin/bash

function main {
    getScriptPath

    COUNTER=0
    while((COUNTER < 5))
    do
	    startFlux
    done

    exit 0
}

function getScriptPath {
    pushd `dirname $0` > /dev/null
    SCRIPTPATH=`pwd`
    popd > /dev/null
}

function startFlux {
    if ping -q -c 1 -W 1 google.com >/dev/null; then
        WAN=$(dig +short myip.opendns.com @resolver1.opendns.com)
        getZip

        COUNTER=5
        $SCRIPTPATH/xflux -z $ZIP
    else
        COUNTER=$(($COUNTER + 1))
        echo "No Network Connection, Please Connect to the Internet"
        sleep 60s
   fi
}

function getZip {
    ZIP=$(curl ipinfo.io/$WAN/postal)
}

#Run Main
main
