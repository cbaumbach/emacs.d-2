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

;;; Make modeline of active window stand out more.
(let ((faces (face-list)))
  (cond ((member 'mode-line faces)
         (set-face-foreground 'mode-line "black")
         (set-face-background 'mode-line "DarkSeaGreen2")
         (set-face-foreground 'mode-line-inactive "DarkSeaGreen2")
         (set-face-background 'mode-line-inactive "black"))
        ((member 'modeline faces)
         (set-face-foreground 'modeline "black")
         (set-face-background 'modeline "DarkSeaGreen2")
         (set-face-foreground 'modeline-inactive "DarkSeaGreen2")
         (set-face-background 'modeline-inactive "black"))))

;;; Turn on font lock mode globally.
(global-font-lock-mode t)

;;; Use less syntax highlighting in selected modes and maximum
;;; decoration otherwise.
(setq font-lock-maximum-decoration '((cperl-mode . 1) (t . t)))

;;; Always show matching parentheses.
(show-paren-mode t)

;;; Set text width to 70 columns.
(setq fill-column 70)

;;; Highlight current line in gray.
(global-hl-line-mode 1)
(set-face-background 'hl-line "#070707")
(set-face-foreground 'highlight nil)

;;; Show column number.
(setq-default column-number-mode t)

;;; Display time in mode line.
(display-time)

(provide 'setup-appearance)
