;; hideshow minor mode customization

(load-library "hideshow")
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'ruby-mode-hook 'hs-minor-mode)
(add-hook 'js2-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

(define-key hs-minor-mode-map (kbd "<f10>") 'hs-hide-block)
(define-key hs-minor-mode-map (kbd "<f11>")  'hs-show-block)
