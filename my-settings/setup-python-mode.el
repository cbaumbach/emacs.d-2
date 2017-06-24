(require 'python)

(setq python-shell-interpreter "python3")

(defun python-set-virtualenv (path)
  (interactive "DDirectory: ")
  (setq python-shell-virtualenv-path path))

(defun python-unset-virtualenv ()
  (interactive)
  (setq python-shell-virtualenv-path nil))

(provide 'setup-python-mode)
