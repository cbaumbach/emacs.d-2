;;; No auto-saving by default.
(setq auto-save-default nil)

(defun custom-set-auto-save ()
  "Turn on auto-saving for relatively small, hand-written files
located below my home directory (org files, source code, scripts,
readme files, and so on)."
  (if (string-prefix-p (expand-file-name "~") ; under home directory?
                       (file-truename (buffer-file-name)))
      (if (or (member (file-name-extension (buffer-file-name))
                      '("org"))
              (let ((m (point-min))
                    (M (point-max)))
                (and (< (- M m) 20000)             ; < 20 kb
                     (< (count-lines m M) 1000)))) ; < 1000 lines
          (progn (auto-save-mode 1)
                 (message "Activated auto-saving for %s"
                          (buffer-file-name))))))

(add-hook 'find-file-hook 'custom-set-auto-save)

;;; Don't hide auto-save-list files.
(setq auto-save-list-file-prefix "~/.emacs.d/auto-save-list/saves-")

(provide 'setup-auto-saving)
