(add-hook 'latex-mode-hook
          (lambda ()
            (setq paragraph-start "\\f\\|[ \\t%]*$")
            (setq paragraph-separate "[ \\t\\f%]*$")))

(provide 'setup-tex-modes)
