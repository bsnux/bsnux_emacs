(defun pear/php-mode-init ()
  "Set some buffer-local variables."
  (setq case-fold-search t)
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq c-basic-offset 4)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0))
(add-hook 'php-mode-hook 'pear/php-mode-init)

;; Configuring PHP_CodeSniffer + flymake
;; First of all, check these:
;; 1) Install PHP_CodeSniffer:
;;     $ sudo pear install PHP_CodeSniffer
;; 2) Create a binary file for calling to the CodeSniffer:
;;       $ sudo touch /usr/local/bin/phplint
;;       $ sudo chmod 755 /usr/local/bin/phplint
;;    Add the following lines to the file:
;;       php -f $1 -l
;;       phpcs --standard=PEAR --report=emacs $1
;;       exit 0
(require 'php-mode)
(require 'flymake)

(defun my-php-hook-function () (set (make-local-variable 'compile-command) (format "phplint %s" (buffer-file-name)))) (add-hook 'php-mode-hook 'my-php-hook-function)

(defun flymake-php-init () "Use php and phpcs to check the syntax and code compliance of the current file." (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace)) (local (file-relative-name temp (file-name-directory buffer-file-name)))) (list "phplint" (list local))))

;;This is the error format for : php -f somefile.php -l (add-to-list 'flymake-err-line-patterns '("\(Parse\|Fatal\) error: +\(.?\) in \(.?\) on line \([0-9]+\)$" 3 4 nil 2))

(add-to-list 'flymake-allowed-file-name-masks '("\.php$" flymake-php-init)) (add-hook 'php-mode-hook (lambda () (flymake-mode 1))) 