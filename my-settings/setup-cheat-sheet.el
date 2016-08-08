(defun toggle-cheat-sheet ()
  (interactive)
  (let ((cheat-sheet-filename "~/.emacs.d/cheat-sheet.org"))
    (if (string-equal (buffer-file-name) (expand-file-name cheat-sheet-filename))
        (if (buffer-modified-p)
            (switch-to-buffer (other-buffer))
          (kill-buffer (current-buffer)))
      (find-file cheat-sheet-filename))))

(global-set-key (kbd "C-h C-h") #'toggle-cheat-sheet)

(provide 'setup-cheat-sheet)
