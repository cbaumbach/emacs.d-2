(require 'go-mode)

(add-hook 'go-mode-hook
          #'(lambda ()
              (setq whitespace-style '(empty trailing))))

(provide 'setup-go-mode)
