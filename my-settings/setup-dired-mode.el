(add-hook 'dired-load-hook
          #'(lambda ()
              (setq dired-guess-shell-gnutar "tar")
              (load "dired-x")))

(add-hook 'dired-mode-hook
          #'(lambda ()
              (dired-omit-mode 1)
              (dired-hide-details-mode 1)
              (local-set-key (kbd "M-<") 'beginning-of-dired-buffer)
              (local-set-key (kbd "M->") 'end-of-dired-buffer)))

(autoload 'dired-jump "dired-x"
  "Jump to Dired buffer corresponding to current buffer." t)

(autoload 'dired-jump-other-window "dired-x"
  "Like \\[dired-jump] (dired-jump) but in other window." t)

(define-key global-map "\C-x\C-j" 'dired-jump)
(define-key global-map "\C-x4\C-j" 'dired-jump-other-window)

;;; Use "C-u s" to change switches and reload dired buffer
(setq-default dired-listing-switches "-lh")

(provide 'setup-dired-mode)
