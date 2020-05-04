(require 'go-mode)

(add-hook 'go-mode-hook
          #'(lambda ()
              (setq whitespace-style '(empty trailing))))

(add-hook 'before-save-hook #'gofmt-before-save)

(provide 'setup-go-mode)
