# Flux-Auto-Start-for-Linux
NOTICE: I do not own or claim to own xflux, I simply wrote a simple bash script to start flux with the zip code of your location based on your wan address.

## Install:
1. Clone the Repo and place in directory of your choosing. I suggest the /opt/ directory.
2. Download the linux command line flux application(xflux) from https://justgetflux.com/linux/xflux64.tgz and place it in the same directory as startFlux.sh.
3. If using gnome, launch "Startup Applications Preferences Application" and click add.
4. Fill in information. Command is /"PathToRepo"/Flux-Auto-Start-for-Linux/startFlux.sh

## Optional
If you wish to add an icon to the startup application, add "Icon=pathToIcon" without quotes to the ~/.config/autostart/startFlux.sh.desktop file.
