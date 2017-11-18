(require 'multiple-cursors)

(defun cb/mark-next-like-this ()
  (interactive)
  (mc/mark-next-like-this 1))

(add-to-list 'mc/cmds-to-run-once 'cb/mark-next-like-this)

(defun cb/skip-next-like-this ()
  (interactive)
  (mc/mark-next-like-this 1)
  (mc/skip-to-next-like-this))

(add-to-list 'mc/cmds-to-run-once 'cb/skip-next-like-this)

(provide 'setup-multiple-cursors-mode)
