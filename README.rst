EMACS configuration --  Arturo Fernandez <arturo@bsnux.com>
===========================================================

Description
-----------

EMACS configuration files specific for Python development

Configuration tested using Fedora.

Fedora packages installed
-------------------------

	- emacs-common-23.2-7.fc14.i686
	- emacs-23.2-7.fc14.i686
	- emacs-nox-23.2-7.fc14.i686
 
Using Pymacs, Rope and Ropemacs
-------------------------------

For using emacs with Pymacs, Rope and Ropemacs you need to 
install this packages firt. Take a look at *packages* folder.

Installing Pymacs:
******************

::

  $ cp packages/Pymacs-0.23.tar.gz /tmp/
  $ cd /tmp/
  $ tar -zxvf Pymacs-0.23.tar.gz
  $ cd Pymacs-0.23
  $ make
  $ cp pymacs.el ~/.emacs.d/vendor/pymacs.el
  $ emacs -batch -eval '(byte-compile-file "~/.emacs.d/vendor/pymacs.el")'

Installing Rope
***************

::

  $ cp packages/rope-0.9.tar.gz /tmp/
  $ cd /tmp/
  $ tar -zxvf rope-0.9.tar.gz
  $ cd rope-0.9
  $ sudo python setup.py install

Installing Ropemacs
*******************

::

  $ cp packages/ropemacs-0.6.tar.gz /tmp/
  $ cd /tmp/
  $ tar -zxvf ropemacs-0.6.tar.gz
  $ cd ropemacs-0.6
  $ sudo python setup.py install
