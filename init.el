;-----------------------------------------------
;       .emacs
;  Author: Arturo Fdez. M (arturo@bsnux.com)
;  License: GPL v2.0
;-----------------------------------------------

(setq load-path (cons "~/.emacs.d/" load-path))
(setq load-path (cons "~/.emacs.d/configs/" load-path))
(setq load-path (cons "~/.emacs.d/vendor/" load-path))

(defconst emacs-config-dir "~/.emacs.d/configs/")
(defconst emacs-vendor-dir "~/.emacs.d/vendor/")

;; Functions for printing current system name and type
(defun print-system-name()
   (interactive)
   "Get current system's name"
   (print system-name)
)
(defun print-system-type()
   (interactive)
   "Get current system type"
   (print system-type)
)

;; Functions for load different configuration options based on each machine
(defun system-is-linux ()
  (interactive)
  "Return true if the machine is running Linux"
  (string-equal system-type "gnu/linux")
)

(defun system-is-mac()
   (interactive)
   "Return true if os is Mac OS X"
   (string-equal system-type "darwin")
)

(defun system-is-luke ()
  (interactive)
  "Return true if the machine is Luke (home laptop)"
  (string-equal system-name "luke")
)
(defun system-is-jedi ()
  (interactive)
  "Return true if the machine is jedi (office laptop)"
  (string-equal system-name "jedi")
)

(defun system-is-yoda ()
  (interactive)
  "Return true if the machine is yoda (Macbook)"
  (string-equal system-name "yoda.local")
)

;; Insert current date
(defun my-insert-date ()
  "Insert the current date"
  (interactive "*") (insert (format-time-string "%Y/%m/%d"))
)

;; Update timestamp automatically when file is saved
;; file must contain this line: Time-stamp: <>
(setq
  time-stamp-active t
  time-stamp-line-limit 10
  time-stamp-format "%04y/%02m/%02d %02H:%02M"
)
(add-hook 'write-file-hooks 'time-stamp)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


(defun get-subdirs (directory)
  "Get a list of subdirectories under a given directory"
  (apply 'nconc (mapcar (lambda (fa)
                        (and
                         (eq (cadr fa) t)
                         (not (equal (car fa) "."))
                         (not (equal (car fa) ".."))
                         (list (car fa))))
                        (directory-files-and-attributes directory))))

(defun add-dirs-to-loadpath (dir-name)
  "add subdirs of your vendor directory to the load path"
  (dolist (subdir (get-subdirs dir-name))
    (setq load-path (cons (concat dir-name subdir) load-path))
    (message "Added %s to load path" subdir)))

(add-dirs-to-loadpath emacs-vendor-dir)

(defun load-cfg-files (filelist)
  (dolist (file filelist)
    (let ((filename (expand-file-name (concat emacs-config-dir file ".el"))))
      (if (file-exists-p filename)
          (progn
            (load (concat filename))
            (message "Loaded config file: %s" filename))
            (message "Could not load file: %s" filename)))))

(load-cfg-files '("javascript-cfg"
                  "yasnippet-cfg"
                  "autopair-cfg"
                  "zencoding-cfg"
                  "lorem-cfg"
                  "html-cfg"
                  "python-cfg"
                  "django-cfg"
                  "autocomplete-cfg"
                  "linum-cfg"
                  "pyflake-cfg"
                  "mercurial-cfg"
                  "org-cfg"
                  "keybinding-cfg"
                  "lusty-explorer-cfg"
                  "uniquify-cfg"
                  "twittering-cfg"
                  "rinari-cfg"
                  "markdown-cfg"
                  "magit-cfg"
                  "yaml-cfg"
                  "dired-cfg"
                  "geben-cfg"
                  "cfw-cfg"
                  "color-theme-cfg"
                  "pomodoro-cfg"
                  "hs-cfg"
                  "maps-cfg"
                  "arduino-cfg"
                  "erlang-cfg"
                  "php-cfg"
                  "haskell-cfg"
                  "po-cfg"
                  "mustache-cfg"
                  "ruby-cfg"
                  "cc-cfg"
                  ))

; Custom variables
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(php-completion-file "~/.emacs.d/configs/php-completion-file")
 '(inhibit-startup-screen t))

; Syntax highlighting
(global-font-lock-mode 1)

; Highlights a region (Ctr-Space)
(setq-default transient-mark-mode t)

; Column and line numbers
(setq-default column-number-mode t)
(setq-default line-number-mode t)

; Show paren mode
(show-paren-mode 1)

; Tab.
(setq default-tab-width 4);

; Default: text-mode with auto-fill
(setq default-major-mode 'text-mode)
(setq text-mode-hook
       '(lambda () (auto-fill-mode 1)))

; Delete unnecesary auto-save files
(setq delete-auto-save-files t)

;; Using spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Highlights current line
;(global-hl-line-mode 1)

(setq make-backup-files nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight +80 lines
(setq whitespace-style '(lines))
(setq whitespace-style '(empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Fonts
(when window-system
  (if (system-is-luke)
      (set-face-attribute 'default nil :font "Inconsolata-11")
    )
  (if (system-is-jedi)
      (set-face-attribute 'default nil :font "Consolas-10.5")
    )
  (if (system-is-yoda)
      (set-face-attribute 'default nil :font "Monaco-13")
      (setq mac-option-key-is-meta nil)
      (setq mac-command-key-is-meta t)
      (setq mac-command-modifier 'meta)
      (setq mac-option-modifier nil)
    )
  )

;; A concise solution is to alter the interactive form of kill-ring-save and kill-region
(put 'kill-ring-save 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))
    (put 'kill-region 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))

;; Set scroll-bar
(set-scroll-bar-mode 'right)

;; Setting filename on the frame title
(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b"))))

;; Automatically re-visiting the file in current buffer when it was
;; modified by an external program
(global-auto-revert-mode 1)

;; Start emacs as server
(server-start)

;; Setting colors for status bar
(set-face-foreground 'modeline "black")
(set-face-background 'modeline "grey")

(setq initial-scratch-message ";; scratch buffer: Lisp evaluation & draft notes")

;; Disabling VC for using magit
(setq vc-handled-backends nil)

;; Enabling dead-keys. It works with layouts such as: setxkbmap -layout us -variant intl
(require 'iso-transl)

;; Asking if you want close emacs
(defun ask-before-closing ()
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to quit Emacs? "))
    (message "Canceled exit")))

;; Asking before quit (only for x-window)
(when (eq window-system 'x)
    (global-set-key (kbd "C-z") 'ask-before-closing))

;; Custom faces
(custom-set-faces
   '(linum ((t (:inherit shadow :background "gray95"))))
)
