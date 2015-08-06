;; Don't show warning message about magit auto revert mode.
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'magit)

;; Disable magit auto revert mode.
(setq magit-auto-revert-mode nil)

;; Remove some annoying highlighting.
(set-face-attribute 'magit-section-title nil :inherit nil)
(set-face-attribute 'magit-item-highlight nil :inherit nil)
(set-face-attribute 'magit-diff-file-header nil :inherit nil)

;; Improve readability of diff output.
(set-face-foreground 'magit-diff-add "black")
(set-face-foreground 'magit-diff-del "white")
(set-face-foreground 'magit-diff-hunk-header "black")

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
