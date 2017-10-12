(let ((lisp-file (expand-file-name "~/.roswell/lisp/quicklisp/slime-helper.el")))
  (when (file-exists-p lisp-file)
    (load lisp-file)
    (setq slime-lisp-implementations
          '((sbcl ("ros" "-Q" "-l" "~/.sbclrc" "-L" "sbcl-bin" "run"))))
    (setq slime-default-lisp 'sbcl)
    (setq slime-net-coding-system 'utf-8-unix)
    (add-hook 'slime-repl-mode-hook
              #'(lambda ()
                  (enable-paredit-mode)))
    (add-hook 'lisp-mode-hook
              #'(lambda ()
                  (local-set-key (kbd "TAB") 'slime-complete-symbol)
                  (local-set-key (kbd "M-q") 'slime-reindent-defun)
                  (set (make-local-variable lisp-indent-function)
                       'common-lisp-indent-function)
                  (setq slime-load-failed-fasl 'never)))))

(provide 'setup-lisp-mode)
