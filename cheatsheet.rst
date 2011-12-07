Emacs. Simple command reference:
================================

Basic
-----

**C-x C-c**: Exit

Mapping (bsnux_emacs keybinding)
--------------------------------

**F2** : Save file

**F3** : Shell

**F4** : Indent region

**F7** : Copy and paste current line

**C-l** : Go to line number

**F10** : Hide (folding) block

**F11** : Show (folding) block

Movement
--------
**C-p** : Up

**C-n** : Down

**C-f** : Right

**C-b** : Left


Copy & paste
------------

**M-w** : Copy

**C-y** : Paste

**C-space** : Mark a region

Files
-----

**C-x C-f** : Open a file

**C-x C-s** : Save buffer to file

**C-x i** : Insert another file in this buffer

**M-<** : Go to beginning of file

**M->** : Go to end of file

Buffers
-------

**C-x k** : Kill the buffer

**C-x C-w** : Save buffer as

**C-x b** : Switch between buffers


Windows & frames
----------------

**C-x o** : Switch between windows

**C-x 2** : Open a new window (vertically)

**C-x 3** : Open a new window (side by side)

**C-x 5 2** : Create a new frame without a new process

**C-x 5 0** : Close this frame


Finding
-------

**M-x find-name-dired** : Find a file using *dired* mode

**M-x rgrep** : Find text in files


Search & replace
----------------

**C-s** : Search forward (incremental)

**C-r** : Search backward

**C-s C-s** : Search with previously searched string

**M-x query-replace** : Search and replace, asking for confirmation

**M-x replace-string**

**C-x h** : Select all

**M-x rgrep** : Searching recursively for some strings (regexps) in a file tree

Undo & redo
-----------

**C-/** : Undo

**C-x u** : Undo

**C_** : Redo

Deleting
--------

**C-k** : Kill to end of file

**C-d** : Delete current character

Column mode
-----------

For editing columns we can use *CUA* mode:

1. **M-x** cua-mode
2. **C-Enter**
3. Mark text
4. Insert text!

Tags
----

We can use *etags* command for generating our *TAGS* file, which is
used by *Emacs*

**M-.** : Find tag

**M-,** : Go to next match

Org-mode
--------

* Markup:

   *bold*, /italic/, _underlined_, =code= and ~verbatim~, +strike-through+

* In-buffer settings examples:

   #+STARTUP: hideall

   #+TAGS: office(o) home(h) books(b)

   #+PRIORITIES: A B C

* `Kanban <http://www.agilesoc.com/2011/08/08/emacs-org-mode-kanban-pomodoro-oh-my/>`_

* Shortcuts:

  * **Shif-left/right**           : cycle workflow
  * **C-c C-v**                   : show todos in current document
  * **C-c a**                     : call the agenda
  * **C-c C-q**                   : set tag
  * **C-c ,**                     : set priority
  * **M-enter**                   : new item at current level
  * **C-c C-d**                   : Insert a DEADLINE
  * **C-c .**                     : Prompt for date
  * **C-c C-s**                   : Insert SCHEDULED timestamp
  * **C-c .** (one for each date) : Selecting interval dates
  * **C-c C-x a**                 : Archive a *DONE* task

* Creating a header for a table: `|Field A|Field B|Field C RET |- TAB`

Input methods
-------------

* **M-x describe-input-method**: Info. about current input method

Chinese
-------

**M-x set-input-method** RET:

  * **chinese-py**: Pinyin without tones
  * **chinese-tonepy**: Pinyin with tones

    * Example: *ni3*
  * **chinese-sisheng**: It doesn't generate Hanzi

    * Example: *ni3* generates *nǐ*

Tramp
-----

**/sudo:**: Open a file as *root*

**/user@server:**: Open a remote shell for editing files

Coding
------

**C-x RET f undecided-unix**: Change line terminator from Dos/Mac to UNIX

Case conversion
---------------

**M-l**: Convert following word to lower case

**M-u**: Convert following word to upper case

Misc
----

**C-x z** : Repeat last command. To repeat second time type **z**

**M-x describe-variable**

**M-x compile**

**M-x shell-command** : Execute command

**M-x tmm-menubar** : Shows menu options

**M-x comment-region** : Set comments on marked region

**C-c C-c** : Execute script (Python mode and others)

**C-x C-f RET /user@host:/home/arturo/.emacs** : Open remote file using TRAMP

**C-s C-w** : Search word under cursor (equivalent to '*' in Vim)

**M-x python-check** : Checking Python code using Pyflake

**M-x load-file ENTER ~/bsnux_emacs/init.el ENTER** : Reloading your .emacs file while emacs is running

**M-x twit** : Load twittering-mode

**u*** : Open a buffer for posting a tweet (*twittering-mode*)

**M-x ielm** : Launch an interactive elisp command line interface

**C-x 4 a** : Adding a new entry for *ChangeLog* file

**C-u C-c RET**: Retweet for thw tweet pointed by the cursor

**M-x align-regexp**: Align code based on regexp. 1) Mark region. 2) Execute it

**M-x occur**: Display a new buffer with founded occurences in file
