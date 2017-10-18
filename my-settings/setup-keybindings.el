;;; Emulate control, meta, super, and hyper keys and thereby make
;;; keychords available that normally only work in GUI emacs but not
;;; in a terminal.  A keychord like M-( can be now be emulated by
;;; tying M-h (.
;;;
;;; We don't want to lose useful bindings like C-x C-t.  Therefore we
;;; must not unconditionally translate C-t into an event modifier.
;;; This is what local-function-key-map does.  It only translates a
;;; key sequence if it has no binding.  Therefore we unbind the bare
;;; keys to have them translated.  But since a key sequence like C-x
;;; C-t is still bound the C-t in this key sequence is not translated.
;;; If we wanted to unconditionally translate a key sequence without
;;; having to unbind it first we would use input-decode-map instead.
(dolist (key '("C-h" "M-h" "C-t" "M-t")) (global-unset-key (kbd key)))
(define-key local-function-key-map (kbd "C-t") 'event-apply-control-modifier)
(define-key local-function-key-map (kbd "M-t") 'event-apply-meta-modifier)
(define-key local-function-key-map (kbd "C-h") 'event-apply-super-modifier)
(define-key local-function-key-map (kbd "M-h") 'event-apply-hyper-modifier)

;;; Replace some clobbered key bindings.
(global-set-key (kbd "s-h") 'help-command)
(global-set-key (kbd "s-C-h") 'toggle-cheat-sheet)
(global-set-key (kbd "s-C-@") 'copy-from-above-command)
(global-set-key (kbd "s-C-s") 'swap-buffers)
(global-set-key (kbd "s-C-f") 'insert-file-name)
(global-set-key-with-transient-map (kbd "H-h") 'mark-paragraph ("h" 'mark-paragraph))

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
(global-set-key (kbd "C-M-y") 'copy-1-from-above)
(global-set-key (kbd "M-z") 'zap-to-or-up-to-char)
(global-set-key (kbd "C-x C-r") 'view-file)
(global-set-key (kbd "C-x 4 r") 'view-file-other-window)
(global-set-key (kbd "<f9>") 'recompile)
(define-key help-map "a" 'apropos)
(global-set-key (kbd "M-SPC") 'cycle-spacing)

(provide 'setup-keybindings)
