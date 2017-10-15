(require 'multiple-cursors)

(global-set-key (kbd "C-h C-l") 'mc/edit-lines)

(defun cb/mark-next-like-this ()
  (interactive)
  (mc/mark-next-like-this 1))

(defun cb/skip-next-like-this ()
  (interactive)
  (mc/mark-next-like-this 1)
  (mc/skip-to-next-like-this))

(global-set-key-with-transient-map
 (kbd "C-h n") 'cb/mark-next-like-this
 ("n" 'cb/mark-next-like-this)
 ("s" 'cb/skip-next-like-this)
 ("u" 'mc/unmark-next-like-this))

(provide 'setup-multiple-cursors-mode)
