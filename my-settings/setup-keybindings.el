;; Emulate keys via event-apply-XXX-modifier, e.g. a keychord like M-(
;; can be emulated by typing C-h C-t m (.
(global-unset-key (kbd "C-h C-t"))
(define-key local-function-key-map (kbd "C-h C-t S") 'event-apply-shift-modifier)
(define-key local-function-key-map (kbd "C-h C-t a") 'event-apply-alt-modifier)
(define-key local-function-key-map (kbd "C-h C-t c") 'event-apply-control-modifier)
(define-key local-function-key-map (kbd "C-h C-t h") 'event-apply-hyper-modifier)
(define-key local-function-key-map (kbd "C-h C-t m") 'event-apply-meta-modifier)
(define-key local-function-key-map (kbd "C-h C-t s") 'event-apply-super-modifier)

(global-set-key-with-transient-map
 (kbd "C-h n") 'cb/mark-next-like-this
 ("n" 'cb/mark-next-like-this)
 ("s" 'cb/skip-next-like-this)
 ("u" 'mc/unmark-next-like-this))

(defun cb/other-window () (interactive) (other-window 1))
(defun cb/other-frame () (interactive) (other-frame 1))

(global-set-key-with-transient-map (kbd "C-x o") 'cb/other-window ("o" 'cb/other-window))
(global-set-key-with-transient-map (kbd "C-x 5 o") 'cb/other-frame ("o" 'cb/other-frame))

(global-set-key (kbd "M-=") 'er/expand-region) ; M-= expand, Meta - M-= contract, M-0 M-= reset
(global-set-key (kbd "M-x") 'ido-M-x)
(global-set-key (kbd "C-c C-SPC") 'ace-jump-mode)
(global-set-key (kbd "<f5>") 'slime-selector)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer-list-other-window)
(global-set-key (kbd "C-x ra") 'append-to-register)
(global-set-key (kbd "C-x rF") 'copy-file-name-to-register)
(global-set-key (kbd "C-w") 'delete-or-kill-region)
(autoload 'copy-from-above-command "misc" nil 'interactive)
(global-set-key (kbd "C-h C-SPC") 'copy-from-above-command)
(global-set-key (kbd "C-M-y") 'copy-1-from-above)
(global-set-key (kbd "M-z") 'zap-to-or-up-to-char)
(global-set-key (kbd "C-x C-r") 'view-file)
(global-set-key (kbd "C-x 4 r") 'view-file-other-window)
(global-set-key (kbd "<f9>") 'recompile)
(define-key help-map "a" 'apropos)
(global-set-key (kbd "M-SPC") 'cycle-spacing)
(global-set-key (kbd "C-h C-h") 'toggle-cheat-sheet)
(global-set-key (kbd "C-h C-s") 'swap-buffers)
(global-set-key (kbd "C-h C-f") 'insert-file-name)
(global-unset-key (kbd "C-h g"))
(global-set-key (kbd "C-h g a") 'major-mode-ring-add)
(global-set-key (kbd "C-h g r") 'major-mode-ring-remove)
(global-set-key (kbd "C-h g p") 'major-mode-ring-previous)
(global-set-key (kbd "C-h g n") 'major-mode-ring-next)
(global-set-key (kbd "C-h g s") 'major-mode-ring-show)

(provide 'setup-keybindings)
