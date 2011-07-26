;; MobileOrg + Dropbox + org-mode
;; Don't forget to create your ~/Dropbox/MobileOrg folder!
;;-------------------------------------------------------
;; Example of GTD task
;; ** TODO [#A] Buy milk :personal:
;;    DEADLINE: <2011-03-11 Fri>
;; Where:
;;    [#A] => Priority from 'A' to 'D'
;;    :personal: => Tag
;; Mind sweep technique:
;;     An excellent way of ensuring you have thought of everything for your file
;;     is to do a "mind-sweep". Start a heading at the end of the file and start
;;     a new line with two asterisks. Set a timer or alarm clock and spend five
;;     minutes brainstorming all the things on your mind that need doing. As you
;;     think of the item, type a brief description, then Alt-Enter to start a
;;     new line to create a headline at the same level. Work fast to get
;;     everything out of your mind. When the timer is finished, review
;;     the list, add tags and move to the appropriate section of the file.
;; Invoking remember-mode for quick note-taking
;;    $ emacsclient -e "(remember-other-frame)"
;; Markup:
;;    *bold*, /italic/, _underlined_, =code= and ~verbatim~, +strike-through+
;; In-buffer settings examples:
;;    #+STARTUP: hideall
;;    #+TAGS: office(o) home(h) books(b)
;;    #+PRIORITIES: A B C
;; Shortcuts:
;;    Shif-left/right         : cycle workflow
;;    C-c C-v                 : show todos in current document
;;    C-c a                   : call the agenda
;;    C-c C-q                 : set tag
;;    C-c ,                   : set priority
;;    M-enter                 : new item at current level
;;    Insert a deadline       : C-c C-d
;;    Selecting interval dates: C-. (one for each date)
;;-------------------------------------------------------

;; Global shortcut to invoke org-agenda
(global-set-key "\C-ca" 'org-agenda)
;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Files for syncing
(setq org-agenda-files (quote ( "~/Dropbox/gtd.org"
                                "~/Dropbox/events.org")))
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
;; Custom agenda view
(setq org-mobile-force-id-on-agenda-items nil)
(setq org-agenda-custom-commands
       '(("w" todo "TODO")
         ("h" agenda "" ((org-agenda-show-all-dates nil)))
         ("W" agenda "" ((org-agenda-ndays 21)
                         (org-agenda-show-all-dates nil)))
         ("A" agenda ""
          ((org-agenda-ndays 1)
           (org-agenda-overriding-header "Today")))))
;; States for tasks
(setq org-todo-keywords
  '((sequence "TODO" "DONE" "CANCEL" "IN-PROGRESS" "WAITING")))
;; Different color for status
(setq org-todo-keyword-faces
           '(("TODO" . (:foreground "DarkOrange1" :weight bold))
             ("DONE" . (:foregorund "green" :weight bold))
             ("CANCEL" . (:foreground "blue" :weight bold))))
;; remember-mode with org-mode
(org-remember-insinuate)
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(setq org-remember-templates
      '(
        ("Journal" ?j "* %U %?\n\n  %i\n  %a" "~/Dropbox/MobileOrg/journal.org")
        ("Notes" ?n "* %^{Title}\n  %i\n  %a" "~/Dropbox/MobileOrg/notes.org" "Notes")
        )
      )
;; creating a pop-up for remember-mode
(defadvice remember-other-frame (around remember-frame-parameters activate)
  "Set some frame parameters for the remember frame."
  (let ((default-frame-alist (append
                              '(
                                (name . "*Remember*")
                                (width . 80)
                                (height . 10)
                                (vertical-scroll-bars . nil)
                                (menu-bar-lines . 0)
                                (tool-bar-lines . 0)
                                )
                              default-frame-alist)))
    ad-do-it
    ))
; Start the agenda on Monday
(setq org-agenda-start-on-weekday nil)

; Open my main GTD file faster using M-x gtd
(defun gtd ()
   (interactive)
   (find-file "~/Dropbox/gtd.org")
 )