;;; Detect super and hyper when running on windows.
(when (string-equal system-type "windows-nt")
  (setq w32-pass-lwindow-to-system nil)
  (setq w32-lwindow-modifier 'super)
  (setq w32-pass-rwindow-to-system nil)
  (setq w32-rwindow-modifier 'super)
  (setq w32-pass-apps-to-system nil)
  (setq w32-apps-modifier 'hyper))

;;; Simplify debugging emacs lisp macros.
(add-hook 'emacs-lisp-mode-hook
          #'(lambda () (local-set-key (kbd "M-n") 'pp-macroexpand-last-sexp)))
(add-hook 'lisp-interaction-mode-hook
          #'(lambda () (local-set-key (kbd "M-n") 'pp-macroexpand-last-sexp)))

(defmacro cb/define-context-key (keymap key dispatch)
  "Define KEY in KEYMAP to execute according to DISPATCH.

DISPATCH is a form that is evaluated and should return the
command to be executed.

If DISPATCH returns nil, then the command normally bound to KEY
will be executed.

Example:

  (cb/define-context-key hs-minor-mode-map
                         (kbd \"<C-tab>\")
                         (cond
                          ((not (hs-already-hidden-p))
                           'hs-hide-block)
                          ((hs-already-hidden-p)
                           'hs-show-block)))
"
  `(define-key ,keymap ,key
     `(menu-item "context-key" ignore
                 :filter ,(lambda (&optional ignored)
                            ,dispatch))))

(defmacro repeatify-commands (&rest args)
  "Create a set of inter-communicating repeatable commands."
  (let ((binds (mapcar #'(lambda (x)
                           (cons (intern (concat "repeatified-" (symbol-name (car x))))
                                 x))
                       args)))
    (let ((keydefs (mapcar #'(lambda (x)
                               `(define-key map (kbd ,(nth 2 x)) ',(nth 0 x)))
                           binds)))
      `(progn
         ,@(mapcar #'(lambda (x)
                       `(defun ,(nth 0 x) ()
                          (interactive)
                          ,(if (null (nth 3 x))
                               `(,(nth 1 x))
                             `(,(nth 1 x) ,(nth 3 x)))
                          (set-temporary-overlay-map
                           (let ((map (make-sparse-keymap)))
                             ,@keydefs
                             map))))
                   binds)))))

;;; multiple-cursors
(repeatify-commands (mc/mark-next-like-this "n" 1)
                    (mc/skip-to-next-like-this "N")
                    (mc/unmark-next-like-this "u"))

(add-to-list 'mc/cmds-to-run-once 'repeatified-mc/mark-next-like-this)
(add-to-list 'mc/cmds-to-run-once 'repeatified-mc/skip-to-next-like-this)
(add-to-list 'mc/cmds-to-run-once 'repeatified-mc/unmark-next-like-this)

(global-set-key (kbd "C-h n") 'repeatified-mc/mark-next-like-this)
(global-set-key (kbd "C-h C-l") 'mc/edit-lines)

;;; Add autoloads for some functions before binding keys to them.
(autoload 'copy-from-above-command "misc" nil 'interactive)
(autoload 'zap-up-to-char "misc" nil 'interactive)

(global-set-key (kbd "M-x") 'ido-M-x)

(repeatify-commands (other-window "o" 1))
(global-set-key (kbd "C-x o") 'repeatified-other-window)

(repeatify-commands (other-frame "o" 1))
(global-set-key (kbd "C-x 5 o") 'repeatified-other-frame)

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
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "C-h C-s") 'swap-buffers)
(global-set-key (kbd "C-h C-f") 'insert-file-name)
(global-set-key (kbd "C-x C-r") 'view-file)
(global-set-key (kbd "C-x 4 r") 'view-file-other-window)
(define-key help-map "a" 'apropos)

(provide 'setup-keybindings)
