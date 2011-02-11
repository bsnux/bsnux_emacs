;-----------------------------------------------
;       .emacs
;  Author: Arturo Fdez. M (arturo@sanrin.info)
;  Date:   2007-03-24
;  Update: 2009-12-11
;  License: GPL v2.0
;-----------------------------------------------
;  Simple command reference:
;
;  M-w: Copy
;  C-y: Paste
;  C-x C-f: Open a file
;  C-x C-s: Save buffer to file
;  C-x C-c: Exit
;  C-x k: Kill the buffer
;  C-x C-w: Save buffer as
;  C-x i: Insert another file in this buffer
;  C-space: Mark a region
;  C-x o: Switch between windows
;  C-x 2: Open a new window
;  C-x b: Switch between buffers
;  C-s: Search forward (incremental)
;  C-k: Kill to end of file
;  C-x h: Select all
;  M-<: Go to beginning of file
;  M->: Go to end of file
;  M-x describe-variable
;  M-x replace-string
;  M-x compile
;  M-x tmm-menubar: Shows menu options
;  M-x comment-region: Set comments on marked region
;  C-c C-c: Execute script (Python mode and other)
;  C-x C-f RET /arturo@bnsux.com:/home/arturo/.emacs: Open remote file usign
;          TRAMP
;  
;  C-p:     Up
;  C-n:     Down
;  C-f:     Right
;  C-b:     Left
;-----------------------------------------------

; Custom variables
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(c-default-style "bsd")
 '(inhibit-startup-screen t))

; Syntax highlighting
(global-font-lock-mode 1)

; Highlights a region (Ctr-Space)
(setq-default transient-mark-mode t)

; Column and line numbers
(setq-default column-number-mode t)
(setq-default line-number-mode t)

; Tab.
(setq default-tab-width 4);

; Key bindings
(global-set-key "\C-l" 'goto-line)
(global-set-key [f3] 'shell)
(global-set-key [f4] 'indent-region)
(global-set-key [f2] 'save-buffer)

; Default: text-mode with auto-fill
(setq default-major-mode 'text-mode)	
(setq text-mode-hook			
       '(lambda () (auto-fill-mode 1)))

; Delete unnecesary auto-save files
(setq delete-auto-save-files t)	

; JavaScript files are associated to C mode
(setq auto-mode-alist (append '(("\\.js$" . c-mode)) auto-mode-alist))

;;; Electric Pairs
(add-hook 'python-mode-hook
     (lambda ()
      (define-key python-mode-map "\"" 'electric-pair)
      (define-key python-mode-map "\'" 'electric-pair)
      (define-key python-mode-map "(" 'electric-pair)
      (define-key python-mode-map "[" 'electric-pair)
      (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;;; bind RET to py-newline-and-indent
(add-hook 'python-mode-hook '(lambda () 
     (define-key python-mode-map "\C-m" 'newline-and-indent)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default py-indent-offset 4)

(global-hl-line-mode 1)

(setq make-backup-files nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/themes")
(require 'color-theme-wombat)
(color-theme-wombat)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/plugins")
(progn (cd "~/.emacs.d/plugins") (normal-top-level-add-subdirs-to-load-path))

;; Fonts
(set-face-attribute 'default nil :font "Consolas 11")

;; Ropemacs, yasnippets and auto-complete configuration
(add-to-list 'load-path "~/.emacs.d/")
(require 'smart-operator)
(require 'auto-complete)
(global-auto-complete-mode t)
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) 
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")
(load-library "auto-complete-yasnippet")
;;(load-library "init-python")

(add-to-list 'load-path "~/.emacs.d/django-mode")
(require 'django-html-mode)
 (require 'django-mode)
 (yas/load-directory "~/.emacs.d/django-mode/snippets")
 (add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))

(setq whitespace-style '(lines))
(setq whitespace-line-column 80)
(global-whitespace-mode 1)

;; Linum 
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
(global-linum-mode 1)
(setq linum-format "%d ")
