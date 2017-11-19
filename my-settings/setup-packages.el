(defvar cb/list-of-packages
  '((("gnu" . "http://elpa.gnu.org/packages/"))
    (("melpa-stable" . "http://stable.melpa.org/packages/")
     ace-jump-mode
     diminish
     expand-region
     haskell-mode
     magit
     multiple-cursors
     paredit)
    (("melpa" . "http://melpa.org/packages/")
     ;; ess
     undo-tree)))

(defun cb/install-custom-packages (archives-and-packages)
  (mapcar #'(lambda (pkgs)
              (cb/install-packages-from-archive (cdr pkgs) (car pkgs)))
          archives-and-packages)
  (delete-other-windows))

(defun cb/install-packages-from-archive (packages archive)
  (let ((packages-to-install (cb/filter (lambda (package)
                                          (not (package-installed-p package)))
                                        packages)))
    (when packages-to-install
      (cb/delete-package-archives)
      (setq package-archives (list archive))
      (package-refresh-contents)
      (dolist (pkg packages-to-install)
        (package-install pkg)))))

(defun cb/filter (predicate seq)
  (let (result)
    (dolist (element seq)
      (when (funcall predicate element)
        (setq result (add-to-list 'result element))))
    result))

(defun cb/delete-package-archives ()
  (let ((archive-directory (concat user-emacs-directory "elpa/archives")))
    (when (file-exists-p archive-directory)
      (delete-directory archive-directory t))))

(require 'package)
(package-initialize)
(cb/install-custom-packages cb/list-of-packages)

(provide 'setup-packages)
