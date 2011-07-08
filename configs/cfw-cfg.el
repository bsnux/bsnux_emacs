(require 'calfw)

; cfw:open-org-calendar => Displays calendar using org-agenda files
(require 'calfw-org)

(defun cfw:calendar-mode-theme-hook ()
  (require 'color-theme)
  (color-theme-initialize)
  (color-theme-github))
(add-hook 'cfw:calendar-mode 'cfw:calendar-mode-theme-hook)
