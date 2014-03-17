
NAME
----

sprinklerpi/pcb/power24

DESCRIPTION
-----------

This directory contains the power supply module PCB.

A list of parts needed to assemble this module is included.
It is in csv format which can be uploaded to the bill of materials (BOM)
manager in Digi-Key.  In some cases Digi-Key is a bit finicky so minor
alterations to the .csv may be required.

    power24-parts.csv

The PCB was designed using the 2013-jul-07 version of [Kicad][kicad].
To open the project open the power24.pro file.
The other files (power24.sch, power24.kicad_pcb, etc) will be available
from this project.

  [kicad]: http://www.kicad-pcb.org/

The Gerber files which are generated from PCB in Kicad are also included.

    power24-F_Cu.gtl
    power24-B_Cu.gbl
    power24-F_Mask.gts
    ...
  
A script is also included (package-gerbers.sh) in the parent directory
which will automatically packages these so they can be sent to
[Osh Park][osh] to be manufactured.

    $ ../package-gerbers.sh power24

  [osh]: http://www.oshpark.com

