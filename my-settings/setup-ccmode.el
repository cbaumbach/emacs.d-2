(defconst my-c-style
  '("k&r"
    (c-block-comment-prefix . "  ")
    (c-basic-offset . 4)
    (c-hanging-braces-alist . ((block-close before)
                               (substatement-open after)))
    (c-hanging-semi&comma-criteria . (c-semi&comma-no-newlines-before-nonblanks
                                      c-semi&comma-inside-parenlist))
    (c-offsets-alist . ((arglist-cont-nonempty . +)
                        (arglist-close . 0)))))

(c-add-style "personal" my-c-style)

(defun my-c-mode-common-hook ()
  (c-set-style "personal")
  (c-toggle-syntactic-indentation 1)
  (c-toggle-electric-state 1)
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state 1))

(add-hook 'c-mode-common-hook #'my-c-mode-common-hook)

(provide 'setup-ccmode)
