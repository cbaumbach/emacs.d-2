;;; Inhibit loading default init file.
(setq inhibit-default-init t)

;;; Explicitly set foreground and background colors in ms windows.
(when (string-equal system-type "windows-nt")
  (set-background-color "black")
  (set-foreground-color "white"))

;;; Inhibit startup screen.
(setq inhibit-startup-screen t)

;;; Turn off the menu bar.
(menu-bar-mode -1)

;;; Turn off scroll bar.
(if (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;;; Turn off tool bar.
(if (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;;; Truncate lines.
(setq-default truncate-lines t)

;;; Use visual bell.
(setq visible-bell t)

;;; Turn on font lock mode globally.
(global-font-lock-mode t)

;;; Use less syntax highlighting in selected modes and maximum
;;; decoration otherwise.
(setq font-lock-maximum-decoration '((cperl-mode . 1) (t . t)))

;;; Always show matching parentheses.
(show-paren-mode t)

;;; Set text width to 70 columns.
(setq fill-column 70)

;;; Show column number.
(setq-default column-number-mode t)

;;; Display time in mode line.
(display-time)

(provide 'setup-appearance)
