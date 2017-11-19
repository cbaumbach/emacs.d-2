(setq disabled-command-function nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(delete-selection-mode 1)
(setq history-delete-duplicates t)
(setq-default comint-input-ignoredups t)
(setq set-mark-command-repeat-pop t)
(setq comment-empty-lines t)
(setq default-input-method 'german-postfix)
(set-language-environment "UTF-8")
(require 'undo-tree)
(global-undo-tree-mode 1)
(require 'expand-region)
;; Never recenter point when it moves off-screen
(setq scroll-conservatively (1+ 100))
;; Preserve point's screen position when scrolling by full screens
(setq scroll-preserve-screen-position t)
;; Use 4-space indentation for html
(add-hook 'html-mode-hook #'(lambda () (set (make-local-variable 'sgml-basic-offset) 4)))

(provide 'setup-misc)
