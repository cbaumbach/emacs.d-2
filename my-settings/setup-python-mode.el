(defun cb/insert-4-spaces ()
  (interactive)
  (insert "    "))

(defun cb/newline-and-indent-to-first-nonblank ()
  (interactive)
  (newline)
  (indent-relative))

(add-hook 'python-mode-hook
          #'(lambda ()
              (cb/define-context-key python-mode-map
                                     (kbd "TAB")
                                     (when (cb/inside-a-string-p)
                                       #'cb/insert-4-spaces))
              (cb/define-context-key python-mode-map
                                     (kbd "RET")
                                     (when (cb/inside-a-string-p)
                                       #'cb/newline-and-indent-to-first-nonblank))))

(provide 'setup-python-mode)
