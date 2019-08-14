;; Emulate super and hyper keys
(global-unset-key (kbd "C-t"))
(global-unset-key (kbd "C-z"))
(define-key local-function-key-map (kbd "C-t") 'event-apply-super-modifier)
(define-key local-function-key-map (kbd "C-z") 'event-apply-hyper-modifier)

(cb/global-set-key-with-transient-map
 (kbd "C-h n") cb/mark-next-like-this
 ("n" 'cb/mark-next-like-this)
 ("s" 'cb/skip-next-like-this)
 ("u" 'mc/unmark-next-like-this))

(add-to-list 'mc/cmds-to-run-once 'cb/mark-next-like-this--with-transient-map)

(defun cb/other-window () (interactive) (other-window 1))
(defun cb/other-frame () (interactive) (other-frame 1))

(cb/global-set-key-with-transient-map (kbd "C-x o") cb/other-window ("o" 'cb/other-window))
(cb/global-set-key-with-transient-map (kbd "C-x 5 o") cb/other-frame ("o" 'cb/other-frame))

(global-set-key (kbd "C-a") 'cb/move-beginning-of-line-or-buffer)
(global-set-key (kbd "C-e") 'cb/move-end-of-line-or-buffer)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-=") 'er/expand-region) ; M-= expand, Meta - M-= contract, M-0 M-= reset
(global-set-key (kbd "M-x") 'cb/ido-M-x)
(global-set-key (kbd "C-c C-SPC") 'ace-jump-mode)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-c C-s") 'slime-selector)
(global-set-key (kbd "C-x C-b") 'cb/switch-to-buffer-list-other-window)
(global-set-key (kbd "C-x ra") 'append-to-register)
(global-set-key (kbd "C-x rF") 'cb/copy-file-name-to-register)
(global-set-key (kbd "C-w") 'cb/delete-or-kill-region)
(global-set-key (kbd "C-h C-SPC") 'cb/copy-line-from-around)
(global-set-key (kbd "C-M-y") 'cb/copy-char-from-around)
(global-set-key (kbd "M-z") 'cb/zap-to-or-up-to-char)
(global-set-key (kbd "C-x C-r") 'view-file)
(global-set-key (kbd "C-x 4 r") 'view-file-other-window)
(global-set-key (kbd "<f6>") 'revert-buffer)
(global-set-key (kbd "<f9>") 'recompile)
(define-key help-map "a" 'apropos)
(global-set-key (kbd "M-SPC") 'cycle-spacing)
(global-set-key (kbd "C-h C-f") 'cb/insert-file-name)
(global-set-key (kbd "C-h C-l") 'mc/edit-lines)

;;; Major mode ring
(global-unset-key (kbd "C-h g"))
(global-set-key (kbd "C-h g a") 'cb/major-mode-ring-add)
(global-set-key (kbd "C-h g r") 'cb/major-mode-ring-remove)
(global-set-key (kbd "C-h g p") 'cb/major-mode-ring-previous)
(global-set-key (kbd "C-h g n") 'cb/major-mode-ring-next)
(global-set-key (kbd "C-h g s") 'cb/major-mode-ring-show)

;;; Toggling
(global-unset-key (kbd "C-h t"))
(global-set-key (kbd "C-h t c") 'cb/toggle-case-fold-search)
(global-set-key (kbd "C-h t e") 'electric-indent-mode)
(global-set-key (kbd "C-h t f") 'auto-fill-mode)
(global-set-key (kbd "C-h t n") 'cb/toggle-notes)
(global-set-key (kbd "C-h t s") 'cb/toggle-split-orientation)
(global-set-key (kbd "C-h t t") 'toggle-truncate-lines)
(global-set-key (kbd "C-h t SPC") 'whitespace-mode)
(global-set-key (kbd "C-h t TAB") 'cb/toggle-indent-tabs-mode)
(global-set-key (kbd "C-h t w") 'cb/exchange-windows)

(provide 'setup-keybindings)
