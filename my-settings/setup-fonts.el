;;; Choose fonts.
(cond ((string-equal system-type "windows-nt")
       (add-to-list 'initial-frame-alist '(font . "Consolas-12"))
       (add-to-list 'default-frame-alist '(font . "Consolas-12")))
      ((string-equal system-type "gnu/linux")
       (add-to-list 'initial-frame-alist '(font . "-misc-fixed-medium-r-normal--20-200-75-75-c-100-iso10646-1"))
       (add-to-list 'default-frame-alist '(font . "-misc-fixed-medium-r-normal--20-200-75-75-c-100-iso10646-1"))))

;;; Disable bold font.
(mapc #'(lambda (face)
          (set-face-attribute face nil :weight 'normal))
      (face-list))

;;; Make comments easily reabable.
(set-face-foreground 'font-lock-comment-face "green")

;; ;;; Make directory line at the top readable in dired+.
;; (set-face-background 'diredp-dir-heading "black")
;; (set-face-foreground 'diredp-dir-heading "magenta")

(provide 'setup-fonts)
