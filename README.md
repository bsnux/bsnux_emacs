EMACS configuration --  Arturo Fernandez
===========================================================

Description
-----------

EMACS configuration files specific for Python development

Configuration tested using [Fedora](http://fedoraproject.org) and [Ubuntu](http://www.ubuntu.com).

Fresh installation
------------------

1. Clone this project
2. Update modules used by the project:

    * $ git submodule init
    * $ git submodule update

3. Create a *symlink* to your *HOME* directory:

    * $ ln -s ~/bsnux_emacs ~/.emacs.d

Usage
-----

You can load different configuration files to use Emacs with different
programming languages. Please, take a look at *init.el* and load only
files that you need. For example, if you aren't a PHP developer then
you can delete the *php-config* entry for the *init.el* file.

Fedora packages installed
-------------------------

* Fedora 14

    * emacs-common-23.2-7.fc14.i686
    * emacs-23.2-7.fc14.i686
    * emacs-nox-23.2-7.fc14.i686

* Fedora 15

    * emacs-common-23.2-17.fc15.i686
    * emacs-23.2-17.fc15.i686
    * emacs-filesystem-23.2-17.fc15.i686

Ubuntu packages installed
-------------------------

* 11.04 (Natty Narwhal)

    * emacs23- 23.2+1-7ubuntu2
    * emacs23-bin-common-23.2+1-7ubuntu2
    * emacs23-common-23.2+1-7ubuntu2
    * emacsen-common-1.4.19ubuntu2
