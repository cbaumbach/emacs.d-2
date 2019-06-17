(require 'sgml-mode)

(add-hook 'html-mode-hook (lambda ()
                            (cb/major-mode-ring-add 'html-mode)
                            (cb/major-mode-ring-add 'js-mode)))

(provide 'setup-html-mode)
