(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa-stable")
  (package-refresh-contents))

(defun packages-install (packages)
  (mapc #'(lambda (pkg)
            (when (not (package-installed-p pkg))
              (package-install pkg)))
        packages)
  (delete-other-windows))

(provide 'setup-package)
