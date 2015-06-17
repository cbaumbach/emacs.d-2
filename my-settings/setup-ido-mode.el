(ido-mode t)
(ido-everywhere 1)

;;; Stop file system wide autocompletion.
(setq ido-auto-merge-work-directories-length -1)

;;; Enable flex matching.
(setq ido-enable-flex-matching 1)

(defun ido-M-x ()
  "Use ido-like selection for execute-extended-command."
  (interactive)
  (call-interactively
   (intern
    (ido-completing-read
     "M-x "
     (all-completions "" obarray 'commandp)))))

(provide 'setup-ido-mode)
