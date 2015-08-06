(defun eval-and-replace ()
  "Eval and replace last s-expression."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
         (current-buffer))
    (error (message "Invalid expression.")
       (insert (current-kill 0)))))

(defun switch-to-buffer-list-other-window ()
  "Switch to buffer list in other window."
  (interactive)
  (list-buffers)
  (switch-to-buffer-other-window "*Buffer List*" nil))

(defun this-file-name ()
  "Insert current filename after stripping directory."
  (interactive)
  (let ((path (buffer-file-name)))
    (insert (substring path (1+ (position ?/ path :from-end t))))))

(defun copy-file-name-to-register (file-name c)
  "Copy file name to register."
  (interactive "fFile name: \ncCopy to register:")
  (set-register c (cons 'file file-name)))

(defun delete-or-kill-region (start end)
  "With prefix arg same as delete-region, otherwise kill-region."
  (interactive "r")
  (if current-prefix-arg
      (delete-region start end)
    (kill-region start end)))

(defun beginning-of-dired-buffer ()
  "Move to first file or directory in dired buffer skipping `.' and `..'."
  (interactive)
  (beginning-of-buffer)
  (diredp-next-line 1)
  (while (looking-at "[.][.]?$")
    (diredp-next-line 1)))

(defun end-of-dired-buffer ()
  "Move to last file or directory in dired buffer."
  (interactive)
  (end-of-buffer)
  (diredp-previous-line 1))

(defmacro match-any (&rest patterns)
  "Make a predicate saying whether its argument matches any of
the regexps in PATTERNS."
  `(lambda (s)
     (let ((case-fold-search nil))
       (or ,@(mapcar #'(lambda (x) `(string-match ,x s))
                     patterns)))))

(defun what-face (pos)
  "Show name of face under cursor."
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (cond (face (message "Face: %s" face))
          (t (message "No face at %d" pos)))))

(provide 'setup-defuns)
