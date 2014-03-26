
NAME
----

SprinklerPI - Web based sprinkler controller using Linux

DESCRIPTION
-----------

An web based sprinkler controller using Linux that is
open source and highly customizable.

The hardware design (PCBs) is modular with a power supply
and control/drivers.  Each control/driver can control eight
valves and there can be three of these control/drivers
for a maximum of 24 valves.

The system is controlled using a Linux computer.
The current design uses a [RasberryPI][rpi] but any computer capable
of communication using SPI will work.

  [rpi]: http://www.rasberrypi.org

The user interface is currently only accessible from the command line.
Watering can be performed using shell scripts which are scheduled
using `cron(8)`.

A web based user interface is in development.

Refer to the full documentation ([doc/design/design.pdf](https://github.com/jmahler/sprinklerpi/blob/build/doc/design/design.pdf?raw=true)) for more info.

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

