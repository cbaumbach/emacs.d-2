(defvar cb/notes-filename nil
  "Path to file where notes should be saved.")

(setq cb/notes-filename "~/notes.org")

(defun cb/toggle-notes ()
  (interactive)
  (if (string-equal (buffer-file-name) (expand-file-name cb/notes-filename))
      (if (buffer-modified-p)
          (switch-to-buffer (other-buffer))
        (kill-buffer (current-buffer)))
    (find-file cb/notes-filename)))

(provide 'setup-notes)
