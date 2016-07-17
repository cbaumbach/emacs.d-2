(add-to-list 'auto-mode-alist '("\\.md$" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd$" . poly-markdown+r-mode))

(require 'poly-R)
(require 'poly-markdown)

(provide 'setup-polymode)
