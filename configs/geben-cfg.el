; Debugging PHP with Emacs
; 1) $ pecl install xdebug
; 2) Add these lines to your php.ini:
;    [Zend]
;    zend_extension = /usr/lib/php/modules/xdebug.so
;
;    [debug]
;    xdebug.remote_enable=on
;    xdebug.remote_handler=dbgp
;    xdebug.remote_host=localhost
;    xdebug.remote_port=9000
; 3) Call to your script using this param: XDEBUG_SESSION_START=1
;    Example: http://localhost/info.php?XDEBUG_SESSION_START=1
; 4) M-x geben
;
; Keys for controlling geben:
; 
;     spc     step into/step over
;     i       step into
;     o       step over
;     r       step out
;     g       run
;     b       set a breakpoint at a line
;     B       set a breakpoint interactively
;     u       unset a breakpoint at a line
;     \C-b    display breakpoint list
;     t       set redirection mode
;     \C-u t  change redirection mode
;     v       display context variables
;     w       where
;     q       stop
(require 'geben)
