(require 'org)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (R . t)
   (sh . t)))

;;; Don't hardcode css style inline, use css selectors instead.
(setq org-html-htmlize-output-type 'css)

;;; Don't evaluate code blocks during export.
(setq org-export-babel-evaluate nil)

(add-hook 'org-mode-hook 'turn-on-auto-fill)

;;; Don't ask the user for confirmation when evaluating R code.
(setq org-confirm-babel-evaluate
      #'(lambda (lang body)
          (not (or
                (string= lang "emacs-lisp")
                (string= lang "R")))))

(provide 'setup-org-mode)
