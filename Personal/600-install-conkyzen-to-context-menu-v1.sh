#!/bin/bash
set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
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