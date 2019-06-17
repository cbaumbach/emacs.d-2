;;; The next line is automatically added by package.el.  Leave it to
;;; satisfy package.el but turn it into a comment to disable it.
;;; (package-initialize)

;;; Add directory with setup files to load-path.
(add-to-list 'load-path (concat user-emacs-directory "my-settings"))

;;; Prevent Custom from writing to this file.
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'setup-appearance)
(require 'setup-packages)
(require 'setup-defuns)
(require 'setup-deftest)

;;; General setup.
(require 'setup-ack)
(require 'setup-major-mode-ring)
(require 'setup-misc)
(require 'setup-notes)
(require 'setup-whitespace)

;;; Setup modes.
(require 'setup-ace-jump-mode)
(require 'setup-bookmarks)
(require 'setup-ccmode)
(require 'setup-dired-mode)
(require 'setup-ediff)
;; (require 'setup-ess-mode)
(require 'setup-go-mode)
(require 'setup-html-mode)
(require 'setup-ido-mode)
(require 'setup-js-mode)
(require 'setup-lisp-mode)
(ignore-errors (require 'setup-magit))
(require 'setup-multiple-cursors-mode)
(require 'setup-org-mode)
(require 'setup-paredit-mode)
(require 'setup-proced-mode)
(require 'setup-python-mode)

;;; Depends on other things being loaded.
(require 'setup-fonts)
(require 'setup-keybindings)
(require 'setup-mode-line)
