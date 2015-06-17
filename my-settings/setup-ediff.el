(require 'ediff)

;;; Never open a new frame for ediff.
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; Make ediffs more readable.
(set-face-foreground 'ediff-even-diff-A    "black")
(set-face-foreground 'ediff-even-diff-B    "black")
(set-face-foreground 'ediff-odd-diff-A     "black")
(set-face-foreground 'ediff-odd-diff-B     "black")
(set-face-foreground 'ediff-current-diff-A "black")
(set-face-foreground 'ediff-current-diff-B "black")
(set-face-background 'ediff-even-diff-A    "white")
(set-face-background 'ediff-even-diff-B    "white")
(set-face-background 'ediff-odd-diff-A     "white")
(set-face-background 'ediff-odd-diff-B     "white")
(set-face-background 'ediff-current-diff-A "yellow")
(set-face-background 'ediff-current-diff-B "yellow")

(provide 'setup-ediff)
