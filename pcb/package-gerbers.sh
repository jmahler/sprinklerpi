#!/bin/bash

#
# Run this script in the current directory
# containing all the Gerber files for a PCB.
# This script renames them and packages them
# up so they can be sent to OSH Park to be
# manufactured.
#
# With the current layout this script is called from
# a sub-directory.  For example, with the control_driver PCB.
#
#  pcb/control_driver$ ../package-gerbers.sh control_driver
#
#  # outputs to control_driver.zip
#
# Osh Park
#
#   http://www.oshpark.com/guidelines
#

NAME=$1
GDIR=$NAME/

if [[ -z $NAME ]]; then
	echo "usage: package-gerbers.sh <name>";
	exit 1;
fi

if [ ! -d "$GDIR" ]; then
	mkdir $GDIR
fi

#
# Copy files to the expected Osh Park names.
# If any of these files are missing it is
# likely because that layer is not selected
# for Gerber plot output.
#
cp $NAME-F_Cu.gtl $GDIR/$NAME.GTL
cp $NAME-B_Cu.gbl $GDIR/$NAME.GBL
cp $NAME-F_Mask.gts $GDIR/$NAME.GTS
cp $NAME-B_Mask.gbs $GDIR/$NAME.GBS
cp $NAME-F_SilkS.gto $GDIR/$NAME.GTO
#cp $NAME-B_SilkS.gbo $GDIR/$NAME.GBO
cp $NAME-Edge_Cuts.gbr $GDIR/$NAME.GKO
cp $NAME.drl $GDIR/$NAME.XLN

zip -r $NAME.zip $GDIR

#rm -fr $GDIR
