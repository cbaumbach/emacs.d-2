;; Don't show warning message about magit auto revert mode.
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'magit)

;; Disable magit auto revert mode.
(setq magit-auto-revert-mode nil)

;; Recenter screen after hiding details.
(defun magit-show-level-2-all-recenter ()
  "Show only level 2 details and recenter screen."
  (interactive)
  (magit-show-level-2-all)
  (recenter-top-bottom)
  (previous-line 1))

(add-hook 'magit-mode-hook
          #'(lambda ()
              (local-set-key (kbd "M-2") 'magit-show-level-2-all-recenter)))

(provide 'setup-magit)
