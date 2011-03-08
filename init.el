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
                  "django-cfg"
                  "python-cfg"
                  "autocomplete-cfg"
                  "ropemacs-cfg"
                  "linum-cfg"
                  "pyflake-cfg"
                  "mercurial-cfg"
                  "org-cfg"
                  "keybinding-cfg"
                  "lusty-explorer-cfg"
                  "color-theme-cfg"))

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


(global-hl-line-mode 1)

(setq make-backup-files nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(custom-set-faces
	'(linum ((t (:inherit shadow :background "gray95"))))
 )
;; Highlight +80 lines
(setq whitespace-style '(lines))
(setq whitespace-style '(empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Fonts
;(set-face-attribute 'default nil :font "Inconsolata 12")
;(set-face-attribute 'default nil :font "Inconsolata 11")
;(set-face-attribute 'default nil :font "Consolas 10")
(set-face-attribute 'default nil :font "Consolas 11")

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
