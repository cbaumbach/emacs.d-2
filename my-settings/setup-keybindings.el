;;; Detect super and hyper when running on windows.
(when (string-equal system-type "windows-nt")
  (setq w32-pass-lwindow-to-system nil)
  (setq w32-lwindow-modifier 'super)
  (setq w32-pass-rwindow-to-system nil)
  (setq w32-rwindow-modifier 'super)
  (setq w32-pass-apps-to-system nil)
  (setq w32-apps-modifier 'hyper))

(defun cb/other-window () (interactive) (other-window 1))
(defun cb/other-frame () (interactive) (other-frame 1))

(global-set-key-with-transient-map
 (kbd "C-x o") 'cb/other-window
 ("o" 'cb/other-window))

(global-set-key-with-transient-map
 (kbd "C-x 5 o") 'cb/other-frame
 ("o" 'cb/other-frame))

;;; Add autoloads for some functions before binding keys to them.
(autoload 'copy-from-above-command "misc" nil 'interactive)

(global-set-key (kbd "M-x") 'ido-M-x)

;;; Type M-= to expand, Meta - M-= to contract, M-0 M-= to reset.
(global-set-key (kbd "M-=") 'er/expand-region)

(global-set-key (kbd "C-c C-SPC") 'ace-jump-mode)
(global-set-key (kbd "<f5>") 'slime-selector)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer-list-other-window)
(global-set-key (kbd "C-x ra") 'append-to-register)
(global-set-key (kbd "C-x rF") 'copy-file-name-to-register)
(global-set-key (kbd "C-w") 'delete-or-kill-region)
(global-set-key (kbd "C-h C-SPC") 'copy-from-above-command)
(global-set-key (kbd "C-M-y") 'copy-1-from-above)
(global-set-key (kbd "M-z") 'zap-to-or-up-to-char)
(global-set-key (kbd "C-h C-s") 'swap-buffers)
(global-set-key (kbd "C-h C-f") 'insert-file-name)
(global-set-key (kbd "C-x C-r") 'view-file)
(global-set-key (kbd "C-x 4 r") 'view-file-other-window)
(global-set-key (kbd "<f9>") 'recompile)
(define-key help-map "a" 'apropos)

(provide 'setup-keybindings)
