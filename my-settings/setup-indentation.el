;;; Improve cperl indentation.
(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-continued-statement-offset 4
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)

;;; Harmonize tab settings.
(defvaralias 'cperl-indent-level 'tab-width)

(provide 'setup-indentation)
