(when (member "Unifont" (font-family-list))
  (add-to-list 'initial-frame-alist '(font . "Unifont-12"))
  (add-to-list 'default-frame-alist '(font . "Unifont-12")))

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
