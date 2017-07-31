(add-hook 'html-mode-hook
          #'(lambda ()
              (set (make-local-variable 'sgml-basic-offset) 4)))

(provide 'setup-html-mode)
