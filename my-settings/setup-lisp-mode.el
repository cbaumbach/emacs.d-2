;;;===================================================================
;;; Common Lisp
;;;===================================================================

(require 'slime)

(slime-setup '(slime-repl slime-fuzzy))

(setq inferior-lisp-program "sbcl"
      lisp-indent-function 'common-lisp-indent-function
      slime-net-coding-system 'utf-8-unix)

(add-hook 'slime-repl-mode-hook
          (lambda ()
            (enable-paredit-mode)
            (local-set-key (kbd "TAB") 'slime-fuzzy-complete-symbol)))

;;; mkdir -p ~/HyperSpec
;;; cd ~/HyperSpec
;;; wget http://ftp.lispworks.com/pub/software_tools/reference/HyperSpec-7-0.tar.gz
;;; tar xzf HyperSpec-7-0.tar.gz

(setq common-lisp-hyperspec-root (concat "file://" (expand-file-name "~") "/HyperSpec/HyperSpec/"))

;;;===================================================================
;;; Emacs Lisp
;;;===================================================================

(defun cb/bind-elisp-keys ()
  (local-set-key (kbd "C-c C-z") 'ielm)
  (local-set-key (kbd "C-c C-l") 'cb/elisp-load-buffer)
  (local-set-key (kbd "C-c C-m") 'macrostep-expand))

(add-hook 'emacs-lisp-mode-hook 'cb/bind-elisp-keys)
(add-hook 'lisp-interaction-mode-hook 'cb/bind-elisp-keys)

(require 'eldoc)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'eldoc-mode)
(add-hook 'ielm-mode-hook 'eldoc-mode)

(provide 'setup-lisp-mode)
