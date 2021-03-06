# Calfw - A calendar framework for Emacs

## What is calfw?

This program displays a calendar view in the Emacs buffer.

![Calfw image](https://cacoo.com/diagrams/OnjKgBHat0kHs0xp-9E5E0.png?width=600)

## Installation

To use this program, locate this file to load-path directory,
and add the following code to your .emacs.

    (require 'calfw)

Executing the command `cfw:open-calendar-buffer', switch to the calendar buffer.
You can navigate the date like calendar.el.

Schedule data which are shown in the calendar view, are collected by a
list of the struct `cfw:source` objects through the named argument
variables `:contents-sources` and `:annotation-sources`. The former
source defines schedule contents. The later one does date
annotations like the moon phases.

This program gets the holidays using the function
`calendar-holiday-list`. See the document for the holidays.el and the Info text.

## Key bindings

In the calendar buffer and region, you can use following key bindings:

<table>
  <tr><th>Navigation        </th><th></th></tr>
  <tr><td>  [left], C-b, h  </td><td> Previous day</td></tr>
  <tr><td>  [right], C-f, l </td><td> Next day</td></tr>
  <tr><td>  [up], C-p, k    </td><td> Previous week</td></tr>
  <tr><td>  [down], C-n, j  </td><td> Next week</td></tr>
  <tr><td>  C-a, ^          </td><td> Week begin</td></tr>
  <tr><td>  C-e, $          </td><td> Week end</td></tr>
  <tr><td>  [home]          </td><td> Month begin</td></tr>
  <tr><td>  [end]           </td><td> Month end</td></tr>
  <tr><td>  [PgUp], &lt;    </td><td> Previous month</td></tr>
  <tr><td>  [PgDown], &gt;  </td><td> Next month</td></tr>
  <tr><td>  t               </td><td> Today</td></tr>
  <tr><td>  g               </td><td> Absolute date (YYYY/MM/DD)</td></tr>
  <tr><th>Operation         </th><th></th></tr>
  <tr><td>  r               </td><td> Refresh data and re-draw contents</td></tr>
  <tr><td>  SPC             </td><td> Pop-up detail buffer (like Quicklook in Mac)</td></tr>
  <tr><td>  [click]         </td><td> Jump (howm, orgmode)</td></tr>
</table>

The buttons on the toolbar can be clicked.

## Add-ons:

Following programs are also useful:

- calfw-howm.el : Display howm schedules (http://howm.sourceforge.jp/index.html)
- calfw-ical.el : Display schedules of the iCalendar format, such as the google calendar.
- calfw-org.el  : Display org schedules (http://orgmode.org/)

## Setting example:

### For howm users:

    (eval-after-load "howm-menu" '(progn
      (require 'calfw-howm)
      (cfw:install-howm-schedules)
      (define-key howm-mode-map (kbd "M-C") 'cfw:open-howm-calendar)
    ))


If you are using Elscreen, here is useful.

    (define-key howm-mode-map (kbd "M-C") 'cfw:elscreen-open-howm-calendar)

You can display a calendar in your howm menu file.

    %here%(cfw:howm-schedule-inline)

![howm menu embedding](https://cacoo.com/diagrams/vrScI4K2QlmDApfd-1F941.png)

### For org users:

    (require 'calfw-org)

Then, M-x cfw:open-org-calendar.

![org-agenda and calfw-org](https://cacoo.com/diagrams/S6aJntG6giGs44Yn-89CB2.png)

### For iCal (Google Calendar) users:

Here is a minimum sample code:


    (require 'calfw-ical)
    (cfw:open-ical-calendar "http://www.google.com/calendar/ical/.../basic.ics")

![Google Calendar and calfw-ical](https://cacoo.com/diagrams/vrScI4K2QlmDApfd-5E808.png)

## Customize

(todo...)

## History

- 2011/07/05 ver 1.0 : Refactored the whole implementation and design. Improved UI and views.
- 2011/01/07 ver 0.2.1 : Supporting org-agenda schedules.
- 2011/01/07 ver 0.1 : First release. Supporting howm and iCal schedules.

--------------------------------------------------
SAKURAI, Masashi
m.sakurai atmark kiwanami.net

Time-stamp: <2011-07-05 02:39:25 sakurai>
