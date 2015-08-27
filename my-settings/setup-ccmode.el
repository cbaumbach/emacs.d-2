;;; Set C indentation style.
(setq c-default-style '((java-mode . "java")
                        (awk-mode . "awk")
                        (other . "stroustrup")))

;;; Don't put an asterisk continuation lines of block comments.
(setq-default c-block-comment-prefix "  ")

;;; Harmonize tab settings.
(defvaralias 'c-basic-offset 'tab-width)

(c-set-offset 'arglist-cont-nonempty '+)
(c-set-offset 'arglist-close 0)

(defun my-c-mode-common-hook ()
  (c-toggle-electric-state 1)
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state 1)
  (c-toggle-syntactic-indentation 1))

(add-hook 'c-mode-common-hook #'my-c-mode-common-hook)

(setq c-hanging-semi&comma-criteria
      (list #'c-semi&comma-no-newlines-before-nonblanks
            #'c-semi&comma-inside-parenlist))

(provide 'setup-ccmode)
