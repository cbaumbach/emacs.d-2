(require 'diminish)

(diminish 'abbrev-mode)
(diminish 'auto-fill-function)
(eval-after-load "paredit" '(diminish 'paredit-mode))
(diminish 'undo-tree-mode)

(provide 'setup-mode-line)
