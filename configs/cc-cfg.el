(setq c-basic-offset 4)
(setq c-default-style "python")

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(add-hook 'c-mode-common-hook
          (function (lambda ()
                      (flymake-mode t)
                      )))
