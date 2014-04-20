
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

CONTENTS
--------

There are various components to this system each arranged in their
own directory as described below.

  bin/ - Binaries and daemons.

  doc/ - All documentation including: design manual, testing manual, etc.

  etc/ - Daemon init.d files and configuration for [Nginx][nginx] web server.

  include/ - Libraries and headers for programs in bin/.

  lib/ - Associated libraries for headers in `include/`.

  pcb/ - Printed circuit board (PCB) designs using [Kicad][kicad].

  www/ - Web interface written in [PHP][php].

  www/sprinklerpi/ - SprinklerPI files.  Both the web interface and daemons
    read and modify these files.

  [kicad]:http://www.kicad-pcb.org

  [PHP]:http://www.php.net

  [nginx]:http://www.nginx.org

FAQ
---

Q. Why does this design use files to communicate between daemons
and the web server?  Doesn't this make it more complex?

A. There are several reasons why a file system interface was used:

  - transparent - The files can be viewed using standard command
  line tools (`cat`).  This makes it simple to verify the operation
  of a daemon, web interface or any other program.

  - debugging - The files can be viewed and modified using standard
  command line tools and this makes it is easy to test and verify
  operation.

  - security - The daemons which control watering need permissions to
  write to the SPI device.  But the web server and other user
  programs don't since these use the files.  This reduces the
  potential magnitude of any privilege escalation bugs.

  - history - The current state of the system can be saved by
  simply saving the files.
  A version control system such as [Git][git] can even
  be used to record the history.

  - interoperable - Any program in any language can interface files
  and no special libraries are required.
  This system uses programs written in C, Perl, PHP, and they all
  communicate with each other using these files.

  - One alternative would be to use sockets.
  This would allow communication between daemons.
  But the state of the system cannot be easily examined.
  Also, the state cannot be saved unless it is dumped to some
  intermediate format.
  Sockets programming is also more complex than file operations.

  - Another alternative is to create a monolithic program which does
  everything.  This shares all the shortcomings of a socket interface.
  And since the system is not modular it is also difficult to debug.

  [git]:http://git-scm.org

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

