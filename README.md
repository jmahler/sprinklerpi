
## NAME

SprinklerPI - Web based sprinkler controller.

## DESCRIPTION

SprinklerPI is a full featured web based sprinkler controller.

From the web interface watering schedules can be created and edited.
Each schedule can have any number of entries which describe when to
turn a valve on and for how long.  Any there are no limits on the
number of schedules or number of entries which can be created.

The hardware design is modular allowing it to be scaled up
or down for a particular install.  Each driver can drive eight
valves with one on at a time.  And there can be up to three
drivers allowing for the control of 24 valves.

The controller runs Linux, in this case a [RasberryPI][rpi],
 which makes it reliable and secure.

  [rpi]: http://www.rasberrypi.org

The software architecture is designed to be simple and maintainable.
All programs (daemons, web interface) communicate with each other
using a set of human readable text files.  And each daemon is designed
to do one task and do it well.

For example, when the web interface modifies a schedule, the scheduled
daemon is notified and it updates its current schedules.
When an entry in a schedule becomes due the schedule daemon adds it to
the queue.  Since not all valves can be on at a time the must be queued.
The queue daemon manages the queue and decides which valves to turn on
so that no jobs are lost.  Finally, the watering daemon watches
the valve files and physically turns on valves.
And all of these files can be viewed and edited from the command line
which simplifies debugging.

    programs:    www   scheduled  queued   waterd
                   \     /   \     /  \     /  \
                    \   /     \   /    \   /    \
    files:         schedule   queue    valves  (device)

In cases where the controller is on a private network or
behind firewalls, daemons are included which will proxy the
commands so that it can be accessed on a public network.

                              firewall
                           public | private
                                  |
    programs:    ...    server <--|--- client
                   \     /        |       \
                    \   /         |        \
    files:         valves         |      (device)
                                  |

All software and hardware designs are free and released under
the [GNU General Public License][gpl].

## CONTENTS

There are various components to this system, each in their own directory,
as described below.

  bin/ - Binaries and daemons.

  doc/ - All documentation including: design manual, testing manual, etc.

  etc/ - Daemon init.d files and configuration for [Nginx][nginx] web server.

  include/ - Libraries and headers for programs in bin/.

  lib/ - Associated libraries for headers in `include/`.

  pcb/ - Printed circuit board (PCB) designs using [Kicad][kicad].

  www/ - Web interface written in [PHP][php].

  sprinklerpi/ - SprinklerPI files.  Both the web interface and daemons
    read and modify these files.

  [kicad]:http://www.kicad-pcb.org

  [php]:http://www.php.net

  [nginx]:http://www.nginx.org

  [apache]:http://www.apache.org

## SYSTEM SETUP

The system needs to have various packages installed in order to function.

Since some of the daemons are written in [Perl][perl] several
Perl libraries must be installed.  Specifically YAML::Syck
and Linux::Inotify2.

  [perl]:http://www.perl.org

Under [Debian][deb] Linux these can be installed using
`apt-get install <pkg>`.

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

At this point, with the Perl libraries installed, it should be possible
to run the queue daemon (`spkpi-queued`), scheduler
daemon (`spkpi-scheduled`), demo daemon (`spkpi-demo`).

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
on the device directly may determine what can be compiled.
For example, the `water` command cannot be compiled on systems without
SPI headers.  For a server only system just make the server.

    $ make spkpi-waterd-server

The final step in setting up the system is configuring the web server.
The YAML libraries that [PHP][php] depends on are taken care of during
the previous instructions.  However the PHP version of YAML must
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
has not been setup yet.

The files in this project under `www/` are for a web interface.
The web server being used should be configured so that
the site root is `www/html`.  An example configuration
for [Nginx][nginx] is in `etc/nginx`.  A similar configuration
can be created for Apache.

Since the web server must be able to modify the sprinklerpi
files the permissions must be correct.  Here the web server
is running under the user `www-data`.  Other configurations
may use the `apache` user.

    $ sudo chown -R :www-data sprinklerpi/
    $ sudo chmod -R g+w sprinklerpi/

The `_config.inc` is where the site is configured.

    www/html/_config.inc

## STARTUP, /etc/init.d/

Depending upon how this system is designed to be run, different daemons
will need to be started.  A set of startup scripts are provided in
/etc/init.d for each of the situations.

The init scripts expect a basic configuration to be present in

    /etc/default/sprinklerpi

otherwise it will use default values which probably won't work for everybody.
This file can either be copied or a symbolic link can be created.

    $ sudo ln -s /home/jeri/sprinklerpi/etc/default/sprinklerpi \
        /etc/default/sprinklerpi

This default configuration defines values such as the location of
the sprinklerpi files and binaries.

Once this is done the scripts can be started in the usual way.

    $ sudo etc/init.d/sprinklerpi start/stop

Different scripts will be used depending on the situation (below).

### situation #1: no fire wall

The simplest case is just a standalone server with no need for public
access through a fire wall.  In this case just use the `sprinklerpi`
and `sprinklerpi-waterd` scripts.

    $ sudo etc/init.d/sprinklerpi start
    $ sudo etc/init.d/sprinklerpi-waterd start

### situation #2: fire wall

When it is necessary to communicate through a fire wall the client and
server version will need to be used.  On the client the client version
is used.

    etc/init.d/sprinklerpi-client

On the server the `server` and `sprinklerpi` script is used.

    etc/init.d/sprinklerpi
    etc/init.d/sprinklerpi-server

## DEVELOPMENT

For development it is often easier to configure your PATH so that
the daemons and binaries can be easily run.  For example, the
following line a .bashrc would setup the PATH.

    export PATH=$HOME/sprinklerpi/bin:$PATH

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

Q.  Why does the demo continue running for a long time even after
switching to another mode?

A. When using the client/server proxy this is because of all the messages
that have been queued up in the network buffer.  It can be seen by
looking at the valve files on the server that they are not changing.

    cat sprinklerpi/valves/*

And it can be seen that not messages are being sent by monitoring the
traffic using [Wireshark][ws].

It won't stop until the entire queue on the client side has been emptied
which can take several minutes.  Each message is only a few bytes so quite
a few can be stored.

  [ws]:http://www.wireshark.org

## AUTHOR

Jeremiah Mahler <jmmahler@gmail.com><br>
<http://github.com/jmahler>

## COPYRIGHT

Copyright &copy; 2014, Jeremiah Mahler All Rights Reserved.<br>
This project is free software and released under
the [GNU General Public License][gpl].

  [gpl]: http://www.gnu.org/licenses/gpl.html

