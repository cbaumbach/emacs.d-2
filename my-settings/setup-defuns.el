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

(defun swap-buffers (&optional arg)
  "Exchange buffers of current and next window.  With prefix
argument exchange buffers of current and previous window."
  (interactive "P")
  (let* ((this-win (selected-window))
         (find-other-window (if arg #'previous-window #'next-window))
         (other-win (funcall find-other-window))
         (this-buffer (window-buffer this-win))
         (other-buffer (window-buffer other-win)))
    (set-window-buffer other-win this-buffer)
    (set-window-buffer this-win other-buffer))
  (other-window (if arg -1 1)))

(defun beginning-of-dired-buffer ()
  "Move to first file or directory in dired buffer skipping `.' and `..'."
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 1)                   ; step over directory path
  (if (not (bound-and-true-p dired-hide-details-mode))
      (dired-next-line 1))              ; step over "total used" line
  (if (not (bound-and-true-p dired-omit-mode))
      (dired-next-line 2)))             ; step over . and .. lines

(defun end-of-dired-buffer ()
  "Move to last file or directory in dired buffer."
  (interactive)
  (end-of-buffer)
  (dired-previous-line 1))

(defun insert-file-name ()
  "Prompt for a filename and insert it at point."
  (interactive)
  (let (read-file-name-function read-file-name-default)
    (insert (read-file-name "File name: "))))

(defun copy-1-from-above ()
  "Copy next character from the previous nonblank line."
  (interactive)
  (copy-from-above-command 1))

(defun cb/inside-a-string-p ()
  "Returns non-nil if point is inside a string, otherwise nil."
  (nth 3 (syntax-ppss)))

(defun cb/inside-a-multiline-string-p ()
  "Returns non-nil if point is inside a multiline string, otherwise nil."
  (let ((state (syntax-ppss)))
    (and (nth 3 state)      ; inside a string
         (< (nth 8 state)   ; start of string lies before current line
            (save-excursion
              (beginning-of-line)
              (point))))))

(provide 'setup-defuns)
