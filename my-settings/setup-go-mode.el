(require 'go-mode)

(add-hook 'go-mode-hook
          #'(lambda ()
              (setq indent-tabs-mode nil)
              (setq whitespace-style '(empty trailing))))

(provide 'setup-go-mode)
