(require 'python)
;;; bind RET to py-newline-and-indent
(add-hook 'python-mode-hook '(lambda ()
     (define-key python-mode-map "\C-m" 'newline-and-indent)))
(setq-default py-indent-offset 4)
(add-hook 'python-mode-hook
           #'(lambda ()
               (unless (eq buffer-file-name nil) (flymake-mode 1))
               (setq autopair-handle-action-fns
                     (list #'autopair-default-handle-action
                           #'autopair-python-triple-quote-action))))
