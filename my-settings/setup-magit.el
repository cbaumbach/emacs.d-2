(require 'magit)

(setq magit-auto-revert-mode nil)

;;; For some unknown reason the dracula theme does not apply fully to
;;; the magit-status buffer unless I reload it.  Without reloading,
;;; the magit-diff-removed-highlight and magit-diff-added-highlight
;;; faces will not have their default red/green foreground with light
;;; red/green background color but will have a white foreground with
;;; purple/teal background.
(add-hook 'magit-mode-hook (lambda () (load-theme cb/color-theme t)) t)

(provide 'setup-magit)
