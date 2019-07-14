(defun cb/install-packages (archives-and-packages)
  "Install packages from specific archives.

If archive Y is listed after archive X and a package listed under
archive Y depends on a package that is not already installed, the
needed package will be searched in archives X and Y with the more
recent version of the package winning.  Therefore, in order to
force installation of a package from a specific archive, the
package should be listed under the given archive and archives
should be sorted by stability.  In other words, archives that
tend to host more recent versions of packages should come after
archives that host older versions of packages."
  (setq package-archives nil)
  (dolist (items archives-and-packages)
    (let ((archive (car items))
          (packages (cdr items))
          packages-to-install)
      (add-to-list 'package-archives archive)
      (dolist (pkg packages)
        (when (not (package-installed-p pkg))
          (add-to-list 'packages-to-install pkg)))
      (when packages-to-install
        (package-refresh-contents)
        (dolist (pkg packages-to-install)
          (package-install pkg))))))

(require 'package)
(package-initialize)

(let ((packages-gnu
       '(("gnu" . "http://elpa.gnu.org/packages/")
         undo-tree))
      (packages-melpa-stable
       '(("melpa-stable" . "http://stable.melpa.org/packages/")
         ace-jump-mode
         diminish
         expand-region
         go-mode
         multiple-cursors
         paredit
         slime))
      (packages-melpa
       '(("melpa" . "http://melpa.org/packages/")
         ;; ess
         )))
  (when (>= emacs-major-version 25)
    (add-to-list 'packages-melpa-stable 'magit t))
  (cb/install-packages (list packages-gnu
                             packages-melpa-stable
                             packages-melpa)))

(provide 'setup-packages)
