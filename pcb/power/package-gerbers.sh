#!/bin/bash

#
# Package up the Gerber files so they can
# be sent to Osh Park to be made.
#
# http://www.oshpark.com/guidelines
#

NAME="sprinklerpi-power-gerber"
GDIR=$NAME/

if [ ! -d "$GDIR" ]; then
	mkdir $GDIR
fi

cp power-F_Cu.gtl $GDIR/power.GTL
cp power-B_Cu.gbl $GDIR/power.GBL
cp power-F_Mask.gts $GDIR/power.GTS
cp power-B_Mask.gbs $GDIR/power.GBS
cp power-F_SilkS.gto $GDIR/power.GTO
#cp power-B_SilkS.gbo $GDIR/power.GBO
cp power-Edge_Cuts.gbr $GDIR/power.GKO
cp power.drl $GDIR/power.XLN

zip -r $NAME.zip $GDIR

#rm -fr $GDIR
