;;; Set C indentation style.
(setq c-default-style '((java-mode . "java")
                        (awk-mode . "awk")
                        (other . "stroustrup")))
(c-set-offset 'arglist-cont-nonempty '+)
(c-set-offset 'arglist-close 0)

;;; Improve cperl indentation.
(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-continued-statement-offset 4
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)

(provide 'setup-indentation)
