(setq-default tab-width 4)
(setq search-whitespace-regexp nil) ; treat whitespace literally during search
(setq-default indent-tabs-mode nil)
(setq-default require-final-newline t)
(setq whitespace-style '(empty tab-mark trailing))
(setq whitespace-action '(auto-cleanup))

;;; We can't use global-whitespace-mode because it always shows "WS"
;;; in the mode line even after whitespace (but not global whitespace)
;;; mode was disabled in a buffer.  By using our own globalized minor
;;; mode the mode line will contain (lowercase) "ws" if, and only if,
;;; whitespace mode is enabled.
(define-globalized-minor-mode cb/global-whitespace-mode
  whitespace-mode whitespace-mode)

(cb/global-whitespace-mode)

(defun cb/disable-whitespace-mode ()
  (interactive)
  (whitespace-mode -1))

(defun cb/toggle-indent-tabs-mode ()
  (interactive)
  (setq indent-tabs-mode (not indent-tabs-mode))
  (message "Literal tabs %s"
           (if indent-tabs-mode "enabled" "disabled")))

(provide 'setup-whitespace)
