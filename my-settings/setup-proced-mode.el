(require 'proced)

;;; Add a match-all command filter to proced-filter-alist.
(add-to-list 'proced-filter-alist '(cmd (args . "")))

(defun proced-filter-by-command (pattern)
  "Filter processes by command string using regex."
  (interactive "sFilter by regex: ")
  (setcdr (cadr (assoc 'cmd proced-filter-alist)) pattern)
  (proced-filter-interactive 'cmd)
  (revert-buffer))

(defun my-proced-settings ()
  "Apply custom proced-mode settings."
  (local-set-key (kbd "C-c C-c") 'proced-filter-by-command))

(add-hook 'proced-mode-hook 'my-proced-settings)

(provide 'setup-proced-mode)
