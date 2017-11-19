(require 'proced)

;;; Add a match-all command filter to proced-filter-alist.
(add-to-list 'proced-filter-alist '(cmd (args . "")))

(defun cb/proced-filter-by-command (pattern)
  "Filter processes by command string using regex."
  (interactive "sFilter by regex: ")
  (setcdr (cadr (assoc 'cmd proced-filter-alist)) pattern)
  (proced-filter-interactive 'cmd)
  (revert-buffer))

(add-hook 'proced-mode-hook
          #'(lambda ()
              (local-set-key (kbd "C-c C-c") 'cb/proced-filter-by-command)))

(provide 'setup-proced-mode)
