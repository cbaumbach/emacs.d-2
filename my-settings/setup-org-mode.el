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

;;; Use relative path names when inserting links.
(setq org-link-file-path-type 'relative)

(add-hook 'org-mode-hook 'turn-on-auto-fill)

;;; Functions for using top-level trees as slides.
(defun org-next-slide ()
  (interactive)
  (org-change-slide 1))

(defun org-previous-slide ()
  (interactive)
  (org-change-slide -1))

(defun org-change-slide (arg)
  (widen)
  (if (> arg 0)
      (outline-next-heading)
    (outline-previous-heading))
  (org-narrow-to-subtree))

(defun org-toggle-skip-confirm-babel-evaluate ()
  "Toggle flag to bypass the need for confirmation when
evaluating source blocks."
  (interactive)
  (setq org-skip-confirm-babel-evaluate
        (not org-skip-confirm-babel-evaluate))
  (message "%s for confirmation when evaluating source blocks"
           (if org-skip-confirm-babel-evaluate
               "Don't ask" "Ask")))

(add-hook 'org-mode-hook
          #'(lambda ()
              (setq-local org-skip-confirm-babel-evaluate nil)
              (local-set-key (kbd "C-c M-s") 'org-toggle-skip-confirm-babel-evaluate)
              (local-set-key (kbd "<down>") 'org-next-slide)
              (local-set-key (kbd "<up>") 'org-previous-slide)))

(setq org-confirm-babel-evaluate
      #'(lambda (lang body)
          (not (or
                org-skip-confirm-babel-evaluate
                (string= lang "emacs-lisp")
                (string= lang "R")))))

(provide 'setup-org-mode)
