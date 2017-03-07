(defun cb/insert-4-spaces ()
  (interactive)
  (insert "    "))

(defun cb/delete-backward-4-characters-in-string ()
  (interactive)
  (let ((start-of-string (nth 8 (syntax-ppss))))
    (delete-char (- (min 4 (- (point) start-of-string 1))))))

(defun cb/newline-and-indent-to-first-nonblank ()
  (interactive)
  (newline)
  (indent-relative))

(add-hook 'python-mode-hook
          #'(lambda ()
              (cb/define-context-key python-mode-map
                                     (kbd "TAB")
                                     (when (cb/inside-a-multiline-string-p)
                                       #'cb/insert-4-spaces))
              (cb/define-context-key python-mode-map
                                     (kbd "DEL")
                                     (when (cb/inside-a-multiline-string-p)
                                       #'cb/delete-backward-4-characters-in-string))
              (cb/define-context-key python-mode-map
                                     (kbd "RET")
                                     (when (cb/inside-a-multiline-string-p)
                                       #'cb/newline-and-indent-to-first-nonblank))))

(provide 'setup-python-mode)
