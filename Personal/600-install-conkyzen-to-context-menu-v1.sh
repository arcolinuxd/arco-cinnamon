#!/bin/bash
set -e
##################################################################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxb.com
# Website	:	https://www.arcolinuxiso.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "################################################################"
echo "#########       conkyzen with rmk               ################"
echo "################################################################"

echo "Right mouse click give conkyzen"

[ -d $HOME"/.local" ] || mkdir -p $HOME"/.local"
[ -d $HOME"/.local/share" ] || mkdir -p $HOME"/.local/share"
[ -d $HOME"/.local/share/nemo" ] || mkdir -p $HOME"/.local/share/nemo"
[ -d $HOME"/.local/share/nemo/scripts" ] || mkdir -p $HOME"/.local/share/nemo/scripts"

cp settings/nemo/conkyzen/* ~/.local/share/nemo/scripts/

echo "################################################################"
echo "#########          conkyzen  installed          ################"
echo "################################################################"
