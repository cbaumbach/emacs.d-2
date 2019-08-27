(require 'dired-x)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq dired-guess-shell-gnutar "tar")

(add-hook 'dired-mode-hook
          #'(lambda ()
              (dired-hide-details-mode 1)
              (local-unset-key (kbd "C-t")) ; unshadow global binding
              (local-set-key (kbd "M-<") 'cb/beginning-of-dired-buffer)
              (local-set-key (kbd "M->") 'cb/end-of-dired-buffer)))

;;; Use "C-u s" to change switches and reload dired buffer
(setq-default dired-listing-switches "-alh")

(provide 'setup-dired-mode)
