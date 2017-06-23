(defvar list-of-packages
  '((("gnu" . "http://elpa.gnu.org/packages/"))
    (("melpa-stable" . "http://stable.melpa.org/packages/")
     ace-jump-mode
     dash
     dash-functional
     expand-region
     git-commit
     magit
     multiple-cursors
     paredit)
    (("melpa" . "http://melpa.org/packages/")
     ;; ess
     undo-tree)))

(defun install-custom-packages (archives-and-packages)
  (mapcar #'(lambda (pkgs)
              (install-packages-from-archive (cdr pkgs) (car pkgs)))
          archives-and-packages)
  (delete-other-windows))

(defun install-packages-from-archive (packages archive)
  (let ((packages-to-install (filter (lambda (package)
                                       (not (package-installed-p package)))
                                     packages)))
    (when packages-to-install
      (delete-package-archives)
      (setq package-archives (list archive))
      (package-refresh-contents)
      (dolist (pkg packages-to-install)
        (package-install pkg)))))

(defun filter (predicate seq)
  (let (result)
    (dolist (element seq)
      (when (funcall predicate element)
        (setq result (add-to-list 'result element))))
    result))

(defun delete-package-archives ()
  (let ((archive-directory (concat user-emacs-directory "elpa/archives")))
    (when (file-exists-p archive-directory)
      (delete-directory archive-directory t))))

(require 'package)
(package-initialize)
(install-custom-packages list-of-packages)

(provide 'setup-packages)
