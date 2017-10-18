(require 'multiple-cursors)

(global-set-key (kbd "C-h C-l") 'mc/edit-lines)

(defun cb/mark-next-like-this ()
  (interactive)
  (mc/mark-next-like-this 1))

(defun cb/skip-next-like-this ()
  (interactive)
  (mc/mark-next-like-this 1)
  (mc/skip-to-next-like-this))

(provide 'setup-multiple-cursors-mode)
