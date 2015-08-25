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

(provide 'setup-ccmode)
