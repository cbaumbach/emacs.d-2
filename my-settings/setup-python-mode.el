(require 'python)

(setq python-shell-interpreter "python3")

(defun cb/python-set-virtualenv (path)
  (interactive "DDirectory: ")
  (setq python-shell-virtualenv-path path))

(defun cb/python-unset-virtualenv ()
  (interactive)
  (setq python-shell-virtualenv-path nil))

(defun cb/run-django-shell (venv manage.py)
  "Run django's python shell in inferior-python-mode.

I had to comment out the following lines in django's \"shell\"
management command found in django/core/management/commands/shell.py.

    if sys.platform != 'win32' and select.select([sys.stdin], [], [], 0)[0]:
        exec(sys.stdin.read())
        return

Otherwise the django shell would hang waiting for input from stdin."
  (interactive "DVirtual environment: \nfPath to manage.py: ")
  (cb/python-set-virtualenv venv)
  (setq python-shell-interpreter-args (concat manage.py " shell"))
  (let ((pwd default-directory))
    (cd (file-name-directory manage.py))
    (call-interactively 'run-python)
    (cd pwd)))

(provide 'setup-python-mode)
