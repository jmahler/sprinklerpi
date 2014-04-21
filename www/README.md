
Installation
------------

The following steps were used on a Debian system.

The following describes how to install YAML for PHP [1].

    $ sudo apt-get install libyaml-dev
    $ sudo pecl install yaml

Add the following line to the php.ini

    # nginx with fpm, /etc/php5/fpm/php.ini
    extension=yaml.so

References
----------

  [1]: http://us2.php.net/manual/en/book.yaml.php

