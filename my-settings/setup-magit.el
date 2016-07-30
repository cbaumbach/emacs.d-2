;; Don't show warning message about magit auto revert mode.
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'magit)

;; Disable magit auto revert mode.
(setq magit-auto-revert-mode nil)

;;; Simplify magit faces.
(set-face-foreground 'magit-diff-removed-highlight "red")
(set-face-background 'magit-diff-removed-highlight "black")
(set-face-foreground 'magit-diff-removed "red")
(set-face-background 'magit-diff-removed "black")
(set-face-foreground 'magit-diff-added-highlight "green")
(set-face-background 'magit-diff-added-highlight "black")
(set-face-foreground 'magit-diff-added "green")
(set-face-background 'magit-diff-added "black")
(set-face-background 'magit-diff-context-highlight "black")
(set-face-foreground 'magit-section-highlight "yellow")

;; Recenter screen after hiding details.
(defun magit-section-show-level-2-all-recenter ()
  "Show only level 2 details and recenter screen."
  (interactive)
  (magit-section-show-level-2-all)
  (recenter-top-bottom)
  (previous-line 1))

(add-hook 'magit-mode-hook
          #'(lambda ()
              (local-set-key (kbd "M-2") 'magit-section-show-level-2-all-recenter)))

(provide 'setup-magit)
