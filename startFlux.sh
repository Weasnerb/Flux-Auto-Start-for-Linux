#!/bin/bash

#Main
main(){
    COUNTER=0
    while((COUNTER < 5))
    do
        WAN=$(dig +short myip.opendns.com @resolver1.opendns.com)
	#If we have internet connection, run the following.
	#Else sleep for a minute and retry.
        if [ "$?" = "0" ]; then
	    #Check if we already know this ip's postal code

	    ZIP=$(curl ipinfo.io/$WAN/postal)
            echo "${ZIP}"
            COUNTER=5
	        $(cd /opt/Flux-Auto-Start-for-Linux/ && ./xflux -z $ZIP)
        else
            COUNTER=$(($COUNTER + 1))
		echo "Cannot get Zip"
            $(sleep 60)
        fi
    done
}

#Run Main
main
