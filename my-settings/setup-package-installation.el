(defun init--install-packages ()
  (packages-install
   '(ace-jump-mode
     dash
     dash-functional
     ess
     expand-region
     git-commit
     haskell-mode
     magit
     markdown-mode
     multiple-cursors
     paredit
     polymode
     slime
     yasnippet)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(provide 'setup-package-installation)
