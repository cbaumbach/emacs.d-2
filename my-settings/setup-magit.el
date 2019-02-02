(require 'magit)

(setq magit-auto-revert-mode nil)

;;; The default colors for displaying changes are much too flashy.
;;; Change colors for current chunk (= chunk containing point).
(set-face-foreground 'magit-diff-removed-highlight "brightred")
(set-face-background 'magit-diff-removed-highlight "black")
(set-face-foreground 'magit-diff-added-highlight "brightgreen")
(set-face-background 'magit-diff-added-highlight "black")
(set-face-background 'magit-diff-context-highlight "black")
(set-face-background 'magit-diff-hunk-region "brightblack")
;;; Change colors for other chunks.
(set-face-foreground 'magit-diff-removed "brightred")
(set-face-background 'magit-diff-removed "black")
(set-face-foreground 'magit-diff-added "brightgreen")
(set-face-background 'magit-diff-added "black")
(set-face-background 'magit-diff-context "black")

(provide 'setup-magit)
