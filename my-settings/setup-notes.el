(defvar cb/notes-filename nil
  "Path to file where notes should be saved.")

(setq cb/notes-filename "~/notes.org")

(defun cb/toggle-notes ()
  (interactive)
  (if (string-equal (buffer-file-name) (expand-file-name cb/notes-filename))
      (switch-to-buffer (other-buffer))
    (find-file cb/notes-filename)))

(provide 'setup-notes)
