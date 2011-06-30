;; MobileOrg + Dropbox + org-mode
;; Don't forget to create your ~/Dropbox/MobileOrg folder!
;;
;; Example of GTD task
;; ** TODO [#A] Buy milk :personal:
;;    DEADLINE: <2011-03-11 Fri>
;; Where:
;;    [#A] => Priority from 'A' to 'D'
;;    :personal: => Tag
;; Invoking remember-mode for quick note-taking
;;    $ emacsclient -e "(remember-other-frame)"
;; Markup:
;;    *bold*, /italic/, _underlined_, =code= and ~verbatim~, +strike-through+
;; Shortcuts:
;;    S-left/right – cycle workflow
;;    C-c C-v – show todos in current document
;;    C-c a - call the agenda

;; Global shortcut to invoke org-agenda
(global-set-key "\C-ca" 'org-agenda)
;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Files for syncing
(setq org-agenda-files (quote ( "~/org/gtd.org"
                                "~/org/notes.org")))
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

;; RTM conf. It allows to integrate tasks for RTM into 'gtd.org' file
;; M-x org-feed-update-all
(setq org-feed-alist
      '(("Remember The Milk"
         "https://www.rememberthemilk.com/rss/bsnux/"
         "~/Dropbox/gtd.org"
         "Remember The Milk"
         :template "* TODO %title\n  %a\n "
         )))
