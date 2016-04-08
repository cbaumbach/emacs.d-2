(defun init--install-packages ()
  (packages-install
   '(ace-jump-mode
     dash
     dash-functional
     dired+
     ess
     expand-region
     git-commit
     haskell-mode
     htmlize
     magit
     multiple-cursors
     paredit
     slime
     undo-tree
     yasnippet)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(provide 'setup-package-installation)
