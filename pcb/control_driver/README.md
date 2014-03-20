
NAME
----

sprinklerpi/pcb/control_driver

DESCRIPTION
-----------

This directory contains the control driver PCB.

A list of parts needed to assemble this module is included.
It is in csv format which can be uploaded to the bill of materials (BOM)
manager in Digi-Key.  In some cases Digi-Key is a bit finicky so minor
alterations to the .csv may be required.

    control_driver-parts.csv

The PCB was designed using the 2013-jul-07 version of [Kicad][kicad].
To open the project open the control_driver.pro file.
The other files (control_driver.sch, control_driver.kicad_pcb, etc)
will be available from this project.

  [kicad]: http://www.kicad-pcb.org/

The Gerber files which are generated from PCB in Kicad are also included.

    control_driver-F_Cu.gtl
    control_driver-B_Cu.gbl
    control_driver-F_Mask.gts
    ...
  
A script is also included (package-gerbers.sh) in the parent directory
which will automatically packages these so they can be sent to
[Osh Park][osh] to be manufactured.

    $ ../package-gerbers.sh control_driver

  [osh]: http://www.oshpark.com

BUGS
----

Version 20140304 of the control/driver PCB has the following bugs:

  1. On power up valve number 1 is on, but all should be off.<br>
     This is caused by faulty clear logic.  When the shift register (74HC194)
     is clear it outputs all zeros to the decoder (74HC238).  All zeros
     and enabled turns on valve one.

  1. Noise on SPI pins causes erratic operation.<br>
     With the SPI pins unconnected any noise, such as from a persons hand,
     will cause all sorts of erratic operation.
     Probably needs a pull down/up resistor.

AUTHOR
------

Jeremiah Mahler <jmmahler@gmail.com><br>
<http://github.com/jmahler>

COPYRIGHT
---------

Copyright &copy; 2014, Jeremiah Mahler All Rights Reserved.<br>
This project is free software and released under
the [GNU General Public License][gpl].

  [gpl]: http://www.gnu.org/licenses/gpl.html

