;; Cheking Python code
;;----------------------
;; Installing a checker, for example:
;;     $ pip install flake8
;; While visiting a Python file, run:
;;     M-x python-check or
;;     C-c C-v or
;;     C-c C-w
(setq python-check-command "flake8")

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list "flake8"  (list local-file))))
   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))