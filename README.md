
## NAME

SprinklerPI - Web based sprinkler control system running Linux.

## DESCRIPTION

- web based
- sprinkler control system
- modular software design
- modular hardware design
- expandable from 1 to 24 valves

SprinklerPI is a web based sprinkler control system running Linux.

Schedules can be created to run valves at some day and time during the week.
There is no limit to the size, complexity, or number of schedules.
The web interface is designed to be simple and easy to use.

The hardware is modular and can be scaled to the size of a particular
situation.  Each control/driver module can drive eight valves and there
can be from one to three of these modules allowing for a maximum of
24 valves.  Expansion is accomplished using a SPI bus with a daisy
chain configuration.

The controller runs Linux on a [RasberryPI][rpi].
Both [Nginx][nginx] and [Apache][apache] web servers are supported
and they can be installed directly on the RasberryPI.
The web interface is written in [PHP][php] which one of the most
commonly used languages for constructing web interfaces.

  [rpi]: http://www.rasberrypi.org
  [PHP]: http://www.php.net

The software architecture is designed to be simple and maintainable.
All programs (daemons, web interface) communicate with each other
using a set of human readable text files.  And each daemon is designed
to do one task and do it well.

For example, when the web interface modifies a schedule, the schedule
daemon, which is watching the schedule file, notices this change and
updates its schedules.  When an entry in a schedule becomes due the
schedule daemon adds it to the queue.  A queue is used because not
all valves can be on at the same time.  The queue daemon manages
the queue and decides which valves to turn on so that no jobs are lost.
Finally, the watering daemon watches the valve files and physically
turns on valves.  And all of these files can be viewed and edited from
the command line which simplifies debugging.

     daemons:  www   scheduled  queued   waterd
                 \     /   \     /  \     /  \
                  \   /     \   /    \   /    \
       files:    schedule   queue    valves  (device)

## CONTENTS

There are various components in this project.  Each in located in its
own directory as described below.

  src/ - All source code and daemons.

  doc/ - All documentation including: design manual, testing manual, etc.

  doc/sprinklerpi-files.zip - An example set of SprinklerPI files.
	Both the web interface and daemons read and modify these files.

  etc/ - Configuration files, init.d scripts, and web server configuration
	examples.

  pcb/ - Printed circuit board (PCB) designs using [Kicad][kicad].

  www/ - Web interface written in [PHP][php].

  [kicad]:http://www.kicad.org

  [php]:http://www.php.net

  [nginx]:http://www.nginx.org

  [apache]:http://www.apache.org

## SYSTEM SETUP

The system requires certain packages to be installed.

Since some of the daemons are written in [Perl][perl], several
libraries must be installed.  Specifically YAML::Syck and Linux::Inotify2.

  [perl]:http://www.perl.org

Under [Debian][deb] Linux packages are available for installation.

  [deb]:http://www.debian.org

    $ apt-get install libyaml-syck-perl
    $ apt-get install liblinux-inotify2-perl

Under [Redhat][rpm] these can be installed using `yum install <pkg>`.

  [rpm]:http://www.redat.com

    $ yum --enablerepo=rpmforge --enablerepo=atomic install perl-YAML-Syck
    $ yum --enablerepo=rpmforge --enablerepo=atomic install perl-Linux-Inotify2

If the packages are not available in [Redhat][rpm] the `cpan` command
can be used.

    $ cpan -i Linux::Inotify2

At this point, with the Perl libraries installed, it should be possible to run
the queue daemon (`spkpi-queued`), and the scheduler daemon
(`spkpi-scheduled`).

The final daemons needed to get the system working are the water
daemon (`spkpi-waterd`) which depends on the `water` command and/or
the client/server daemons.  These are written in C and must be compiled.
To build these change to the root of the project and type `make`,
this will build the library.

    $ make

Then change to the binary directory and type `make` again, this
will build the executables.

    $ cd bin/
    $ make

Depending on whether this system is using a client/server or installed
directly on the device will determine what can be compiled.
For example, the `water` command cannot be compiled on systems without
SPI headers.  For a server only system just make the server.

    $ make spkpi-waterd-server

The final step in setting up the system is configuring the web server.
The YAML libraries that [PHP][php] depends on are taken care of during
the previous instructions.  However, the PHP version of YAML must
still be installed.

  [php]:http://www.php.net

The `pecl` command can be used to install the PHP library.
It should build without error if libyaml libraries were correctly installed
previously.

    $ pecl install yaml

If [Nginx][nginx] is being used as the web server several additional packages
need to be installed.

    $ apt-get install php5-fpm php5-cgi

The `extension=yaml.so` option should be added to `/etc/php5/fpm/php.ini`.
To make debugging easier it is helpful to set "display_errors = On" as well.

A similar configuration must be performed when using [Apache][apache].

Then, after restarting the web server, it should be setup and ready to run.

    $ service php5-fpm restart
    $ service nginx restart

or

    $ service apache2 restart

## SITE SETUP

The system should be setup and have all the necessary libraries
in order to run.  But the location of the html and [PHP][php] files
still needs to be configured.

The files in this project under `www/` are for a web interface.
The web server being used should be configured so that
the site root is `www/html`.  An example configuration
for [Nginx][nginx] is in `etc/nginx`.  A similar configuration
can be created for Apache.

Since the web server must be able to modify the sprinklerpi
files the permissions must be correct.  If the web server is
running as the user `www-data` that user/group should have
read/write access to the files.

    $ sudo chown -R :www-data sprinklerpi/
    $ sudo chmod -R g+w sprinklerpi/

The `_config.inc` is where the site is configured.

    www/html/_config.inc

## STARTUP, /etc/init.d/

Depending upon how this system is being used, different daemons
will need to be started.  A set of startup scripts are provided in
`/etc/init.d/` for each of the situations.

The init scripts expect a basic configuration to be present in

    /etc/default/sprinklerpi

otherwise they will use default values which may not work.
This file can either be copied or a symbolic link can be created.

    $ sudo ln -s /home/jeri/sprinklerpi/etc/default/sprinklerpi \
        /etc/default/sprinklerpi

This default configuration defines values such as the location of
the sprinklerpi files and binaries.

Once this is completed the scripts can be used to start the daemons.

    $ sudo etc/init.d/spkpi-waterd start
    $ sudo etc/init.d/spkpi-scheduled start
    $ sudo etc/init.d/spkpi-queued start

## FAQ

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

Q. Schedules with lots of entries (1000+) get cutoff after making
changes through the web interface.

A. There is a maximum number of POST variables that PHP will allow before
it rejects the submission.  This is likely being exceeded.
To confirm the problem the server error.log should be checked.

To get an idea of the magnitude of this form suppose every minute
each group has a new entry (3) and this is over twelve hours
(12 x 60 x 3 = 2160).  Now for each entry in the schedule there are
six columns (2160 x 6 = 12960).

To fix the problem increase the value of `max_input_vars` in php.ini.

    ; php.ini
    max_input_vars = 15000

Q. Why does wifi sporadically go down when using a Ralink based USB wifi
adapter?

A. This is a known issue with the drivers on a RasberryPI.
By connecting using the Ethernet port the wifi interface can be brought
back up.

    $ sudo ifup wlan0

But the most reliable solution is to use Ethernet instead of wifi.

## AUTHOR

Jeremiah Mahler <jmmahler@gmail.com><br>
<http://github.com/jmahler>

## COPYRIGHT

Copyright &copy; 2014, Jeremiah Mahler All Rights Reserved.<br>
This project is free software and released under
the [GNU General Public License][gpl].

  [gpl]: http://www.gnu.org/licenses/gpl.html

