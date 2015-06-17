;;; Add directory with setup files to load-path.
(add-to-list 'load-path (concat user-emacs-directory "my-settings"))

(require 'setup-appearance)
(require 'setup-package)

;; Install packages if they're missing.
(defun init--install-packages ()
  (packages-install
   '(ace-jump-mode
     dash
     dash-functional
     dired+
     ess
     expand-region
     git-commit-mode
     gitattributes-mode
     gitconfig-mode
     gitignore-mode
     git-rebase-mode
     haskell-mode
     magit
     multiple-cursors
     paredit
     slime
     undo-tree)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(require 'setup-defuns)

;;; General setup.
(require 'setup-auto-saving)
(require 'setup-indentation)
(require 'setup-misc)
(require 'setup-scrolling)
(require 'setup-whitespace)

;;; Setup modes.
(require 'setup-ace-jump-mode)
(require 'setup-dash)
(require 'setup-dired-mode)
(require 'setup-ediff)
(require 'setup-ess-mode)
(require 'setup-expand-region-mode)
(require 'setup-git-modes)
(require 'setup-haskell-mode)
(require 'setup-ido-mode)
(require 'setup-magit)
(require 'setup-multiple-cursors-mode)
(require 'setup-paredit-mode)
(require 'setup-proced-mode)
(require 'setup-slime)
(require 'setup-tex-modes)
(require 'setup-undo-tree-mode)

;;; Depends on other things being loaded.
(require 'setup-fonts)
(require 'setup-keybindings)

;;; Load aliases.
(let ((alias-file "~/.emacs.d/aliases.el"))
  (when (file-readable-p alias-file)
    (load alias-file)))
