(require 'python)

(setq python-shell-interpreter "python3")

(defun cb/python-set-virtualenv (path)
  (interactive "DDirectory: ")
  (setq python-shell-virtualenv-path path))

(defun cb/python-unset-virtualenv ()
  (interactive)
  (setq python-shell-virtualenv-path nil))

(provide 'setup-python-mode)
