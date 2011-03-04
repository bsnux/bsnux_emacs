;; MobileOrg + Dropbox + org-mode
;; Don't forget to create your ~/Dropbox/MobileOrg folder!
;;
;; Example of GTD task: 
;; ** TODO [#A] Buy milk :personal:
;;    DEADLINE: <2011-03-11 Fri>
;; Where:
;;    [#A] => Priority from 'A' to 'D'
;;    :personal: => Tag 

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
