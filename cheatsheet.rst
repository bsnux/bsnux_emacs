EMACS. Simple command reference:
===========================================================

Basic
-----

**C-x C-c**: Exit
n
Mapping
-------

**F2**: Save file

**F3**: Shell

**F4**: Indent region

**F7**: Copy and paste current line

**C-l**: Go to line number

Movement
--------
**C-p**: Up

**C-n**: Down

**C-f**: Right

**C-b**: Left


Copy & paste
------------

**M-w**: Copy

**C-y**: Paste

**C-space**: Mark a region

Files
-----

**C-x C-f**: Open a file

**C-x C-s**: Save buffer to file

**C-x i**: Insert another file in this buffer

**M-<**: Go to beginning of file

**M->**: Go to end of file

Buffers
-------

**C-x k**: Kill the buffer

**C-x C-w**: Save buffer as

**C-x b**: Switch between buffers


Windows
-------

**C-x o**: Switch between windows

**C-x 2**: Open a new window (vertically)

**C-x 3**: Open a new window (side by side)

Finding
-------

*M-x find-name-dired*: Find a file using *dired* mode
*M-x rgrep*: Find text in files


Search & replace
----------------

**C-s**: Search forward (incremental)

**C-r**: Search backward 

**Search with previously searched string**: C-s C-s

**M-x query-replace**: Search and replace, asking for confirmation 

**M-x replace-string**

**C-x h**: Select all

**M-x rgrep**: Searching recursively for some strings (regexps) in a file tree

Undo & redo
-----------

**C-/**: Undo 

**C-x u**: Undo

**C_**: Redo

Deleting
--------

**C-k**: Kill to end of file

**C-d**: Delete current character

Column mode
-----------

For editing columns we can use *CUA* mode:

* **M-x** cua-mode
* **C-Enter**
* Mark text
* Insert text!

Misc
----

**M-x describe-variable**

**M-x compile**

**M-x shell-command**: Execute command

**M-x tmm-menubar**: Shows menu options

**M-x comment-region**: Set comments on marked region

**C-c C-c**: Execute script (Python mode and others)

**C-x C-f RET /user@host:/home/arturo/.emacs**: Open remote file using TRAMP

**C-s C-w**: Search word under cursor (equivalent to '*' in Vim)

**M-x python-check**: Checking Python code using Pyflake

**C-x 5 2**: Create a new window without a new process

**M-x load-file ENTER ~/bsnux_emacs/init.el ENTER**: Reloading your .emacs file while emacs is running

**M-x twit**: Load twittering-mode

**u***: Open a buffer for posting a tweet (*twittering-mode*)

**M-x ielm**: Launch an interactive elisp command line interface
