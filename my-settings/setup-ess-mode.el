(require 'ess-site)

(setq ess-default-style 'C++)

;;; Treat "$" like a space or "-" in R code.
(add-hook 'ess-mode-hook
          #'(lambda () (modify-syntax-entry ?$ "-")))

(setq ess-eval-visibly 'nowait)

(setq ess-S-assign "_")                 ; disable smart "_" key

(setq ess-history-file nil)

(provide 'setup-ess-mode)
