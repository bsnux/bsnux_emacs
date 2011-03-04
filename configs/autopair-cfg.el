(require 'autopair)

(add-hook 'c-mode-common-hook 
           #'(lambda () (autopair-mode)))

(add-hook 'c++-mode-common-hook 
           #'(lambda () (autopair-mode)))

(add-hook 'python-mode-hook 
           #'(lambda () (autopair-mode)))

(add-hook 'css-mode-hook 
           #'(lambda () (autopair-mode)))

(add-hook 'js2-mode-hook 
           #'(lambda () (autopair-mode)))

(add-hook 'php-mode-hook 
           #'(lambda () (autopair-mode)))

(add-hook 'ruby-mode-hook 
           #'(lambda () (autopair-mode)))
