(require 'go-mode)

(add-hook 'go-mode-hook
          #'(lambda ()
              (setq indent-tabs-mode nil)))

(provide 'setup-go-mode)
