(setq-default tab-width 4)
(setq search-whitespace-regexp nil) ; treat whitespace literally during search
(setq-default indent-tabs-mode nil) ; no literal tabs by default
(setq-default require-final-newline t) ; add final newline upon saving by default
(setq whitespace-style '(tab-mark))    ; show literal tab characters
(global-whitespace-mode)

(defun toggle-indent-tabs-mode ()
  (interactive)
  (setq indent-tabs-mode (not indent-tabs-mode))
  (message "Literal tabs %s"
		   (if indent-tabs-mode "enabled" "disabled")))

(defun delete-trailing-blank-lines ()
  (save-excursion
    (save-restriction
      (goto-char (point-max))
      (delete-blank-lines))))

(defun disable-strip-trailing-whitespace ()
  (remove-hook 'before-save-hook 'delete-trailing-whitespace t)
  (remove-hook 'before-save-hook 'delete-trailing-blank-lines t)
  (setq require-final-newline nil))

(defun enable-strip-trailing-whitespace ()
  (add-hook 'before-save-hook 'delete-trailing-whitespace nil t)
  (add-hook 'before-save-hook 'delete-trailing-blank-lines nil t)
  (setq require-final-newline t))

(define-minor-mode strip-trailing-whitespace-mode
  "Strip trailing whitespace from the end of lines and from the
end of the file when the buffer is saved.  Add final newline."
  nil " Strip" nil
  (cond ((eql arg 'toggle)
         (if strip-trailing-whitespace-mode
             (enable-strip-trailing-whitespace)
           (disable-strip-trailing-whitespace)))
        ((> (prefix-numeric-value arg) 0)
         (enable-strip-trailing-whitespace))
        (t (disable-strip-trailing-whitespace))))

(define-globalized-minor-mode global-strip-trailing-whitespace-mode
  strip-trailing-whitespace-mode strip-trailing-whitespace-mode)

(global-strip-trailing-whitespace-mode)

(provide 'setup-whitespace)
