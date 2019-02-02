(setq-default tab-width 4)
(setq search-whitespace-regexp nil) ; treat whitespace literally during search
(setq-default indent-tabs-mode nil)
(setq-default require-final-newline t)
(setq-default whitespace-style '(empty tab-mark trailing))
(make-variable-buffer-local 'whitespace-style)
(setq whitespace-action '(auto-cleanup))

(define-globalized-minor-mode
  cb/global-whitespace-mode
  whitespace-mode
  (lambda ()
    (when (not (memq major-mode '(help-mode)))
      (whitespace-mode 1))))

(cb/global-whitespace-mode)

(defun cb/toggle-indent-tabs-mode ()
  (interactive)
  (setq indent-tabs-mode (not indent-tabs-mode))
  (message "Literal tabs %s"
           (if indent-tabs-mode "enabled" "disabled")))

(provide 'setup-whitespace)
