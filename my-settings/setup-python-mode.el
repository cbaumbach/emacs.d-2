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

If this command seems to hang, open

    venv/lib/python3.6/site-packages/django/core/management/commands/shell.py

and make sure that the following passage occurs:

    if sys.platform != 'win32' and not sys.stdin.isatty() and select.select([sys.stdin], [], [], 0)[0]:
        exec(sys.stdin.read())
        return

Older django versions omitted the \"and not sys.stdin.isatty()\" part."
  (interactive "DVirtual environment: \nfPath to manage.py: ")
  (cb/python-set-virtualenv venv)
  (setq python-shell-interpreter-args (concat manage.py " shell"))
  (let ((pwd default-directory))
    (cd (file-name-directory manage.py))
    (call-interactively 'run-python)
    (cd pwd)))

(add-hook 'inferior-python-mode-hook
          #'(lambda ()
              (toggle-truncate-lines -1)))

(provide 'setup-python-mode)
