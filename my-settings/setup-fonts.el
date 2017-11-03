(let* ((font-family-list (font-family-list))
       (font (cond ((and (string-equal system-type "windows-nt")
                         (member "Consolas" font-family-list))
                    "Consolas-14")
                   ((member "Unifont" font-family-list)
                    "Unifont-12")
                   (t nil))))
  (when font
    (add-to-list 'initial-frame-alist `(font . ,font))
    (add-to-list 'default-frame-alist `(font . ,font))))

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
