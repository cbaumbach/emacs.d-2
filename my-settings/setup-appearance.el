(setq cb/color-theme 'dracula)
(add-hook 'after-init-hook (lambda () (load-theme cb/color-theme t)))

;;; For some unknown reason the dracula theme does not apply fully to
;;; the magit-status buffer unless I reload it.  Without reloading,
;;; the magit-diff-removed-highlight and magit-diff-added-highlight
;;; faces will not have their default red/green foreground with light
;;; red/green background color but will have a white foreground with
;;; purple/teal background.
(add-hook 'magit-status-mode-hook
          (lambda () (load-theme cb/color-theme t)) t)

;;; To get color themes to display correctly in terminal emacs when
;;; connecting via PuTTY, use "xterm-256color" as the terminal type
;;; string to under Connection, Data, and add the following alias to
;;; ~/.bashrc
;;;
;;;     alias emacs='TERM=xterm-256color emacs'

(setq inhibit-default-init t)
(when (display-graphic-p)
  (add-to-list 'default-frame-alist '(foreground-color . "white"))
  (add-to-list 'default-frame-alist '(background-color . "black")))
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(setq-default truncate-lines t)
(setq visible-bell nil
      ring-bell-function 'ignore)
(global-font-lock-mode t)
(show-paren-mode t)
(setq fill-column 70)
(setq-default column-number-mode t)
(display-time)

(provide 'setup-appearance)
