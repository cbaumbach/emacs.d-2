(require 'dired+)

;;; Omit uninteresting files and directories in dired mode.  Toggle
;;; using C-x M-o.
(setq-default dired-omit-mode t)

;;; List files in human readable format in dired-mode.
(setq-default dired-listing-switches "-alh")

;;; Adjust M-< und M-> to jump to the first and last file/directory in
;;; dired buffer.
(add-hook 'dired-mode-hook
          #'(lambda ()
              (local-set-key (kbd "M-<") 'beginning-of-dired-buffer)
              (local-set-key (kbd "M->") 'end-of-dired-buffer)))

(provide 'setup-dired-mode)
