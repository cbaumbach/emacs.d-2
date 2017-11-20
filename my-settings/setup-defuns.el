(defun cb/eval-and-replace ()
  "Eval and replace last s-expression."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
         (current-buffer))
    (error (message "Invalid expression.")
       (insert (current-kill 0)))))

(autoload 'zap-up-to-char "misc" nil t)

(defun cb/zap-to-or-up-to-char (arg char)
  "Without prefix arg delete up to CHAR, otherwise delete up to
and including CHAR."
  (interactive
   (list current-prefix-arg
         (read-char (propertize (if current-prefix-arg
                                    "Zap to char: "
                                  "Zap up to char: ")
                                'face '(:foreground "cyan")))))
  (funcall (if arg #'zap-to-char #'zap-up-to-char) 1 char))

(defun cb/switch-to-buffer-list-other-window ()
  "Switch to buffer list in other window."
  (interactive)
  (list-buffers)
  (switch-to-buffer-other-window "*Buffer List*" nil))

(defun cb/copy-file-name-to-register (file-name c)
  "Copy file name to register."
  (interactive "fFile name: \ncCopy to register:")
  (set-register c file-name))

(defun cb/delete-or-kill-region (start end)
  "With prefix arg same as delete-region, otherwise kill-region."
  (interactive "r")
  (if current-prefix-arg
      (delete-region start end)
    (kill-region start end)))

(defun cb/what-face (pos)
  "Show name of face under cursor."
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (cond (face (message "Face: %s" face))
          (t (message "No face at %d" pos)))))

(defun cb/beginning-of-dired-buffer ()
  "Move to first file or directory in dired buffer skipping `.' and `..'."
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 1)                   ; step over directory path
  (if (not (bound-and-true-p dired-hide-details-mode))
      (dired-next-line 1))              ; step over "total used" line
  (if (not (bound-and-true-p dired-omit-mode))
      (dired-next-line 2)))             ; step over . and .. lines

(defun cb/end-of-dired-buffer ()
  "Move to last file or directory in dired buffer."
  (interactive)
  (end-of-buffer)
  (dired-previous-line 1))

(defun cb/insert-file-name ()
  "Prompt for a filename and insert it at point."
  (interactive)
  (let (read-file-name-function read-file-name-default)
    (insert (read-file-name "File name: "))))

(defun cb/copy-1-from-above ()
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

(defun cb/elisp-load-buffer ()
  "Load the emacs lisp code in the current buffer."
  (interactive)
  (save-excursion
   (save-restriction
     (widen)
     (eval-region (point-min) (point-max)))))

(defmacro cb/define-context-key (keymap key dispatch)
  "Define KEY in KEYMAP to execute according to DISPATCH.

DISPATCH is a form that is evaluated and should return the
command to be executed.

If DISPATCH returns nil, then the command normally bound to KEY
will be executed.

Example:

  (cb/define-context-key hs-minor-mode-map
                         (kbd \"<C-tab>\")
                         (cond
                          ((not (hs-already-hidden-p))
                           'hs-hide-block)
                          ((hs-already-hidden-p)
                           'hs-show-block)))
"
  `(define-key ,keymap ,key
     `(menu-item "context-key" ignore
                 :filter ,(lambda (&optional ignored)
                            ,dispatch))))

(defun cb/toggle-split-orientation ()
  (interactive)
  (when (not (= 2 (count-windows)))
    (error "This only works if there are exactly 2 windows"))
  (let ((split (if (= (window-total-width) (frame-total-cols))
                   'vertical 'horizontal))
        (buffer (window-buffer)))
    (delete-window)
    (if (eq split 'vertical)
        (split-window-horizontally)
      (split-window-vertically))
    (switch-to-buffer buffer)))

(defun cb/exchange-windows ()
  (interactive)
  (when (not (= 2 (count-windows)))
    (error "This only works if there are exactly 2 windows"))
  (let* ((this-window (selected-window))
         (other-window (next-window))
         (this-buffer (window-buffer this-window))
         (other-buffer (window-buffer other-window)))
    (set-window-buffer other-window this-buffer)
    (set-window-buffer this-window other-buffer))
  (other-window 1))

;;; ==================================================================
;;; Transient keymaps
;;; ==================================================================

(defmacro cb/define-key-with-transient-map (map key fn &rest keydefs)
  "Bind KEY to FN in MAP and extend FN to install a transient
keymap with key bindings defined by KEYDEFS.  Every element of
KEYDEFS is a two-element list.  The first element is a key, the
second a command.  Neither FN nor commands in KEYDEFS are
evaluated.

Example:

(define-key-with-transient-map
  (current-global-map)
  (kbd \"C-h n\") cb/mark-next-like-this
  (\"n\" cb/mark-next-like-this)
  (\"s\" mc/skip-to-next-like-this)
  (\"u\" mc/unmark-next-like-this))"
  (let ((fn-name (intern (concat (symbol-name (second fn)) "--with-transient-map"))))
    `(progn
       (defun ,fn-name ()
         (interactive)
         (funcall ,fn)
         (set-transient-map (cb/create-keymap ,@keydefs) t))
       (define-key ,map ,key ',fn-name))))

(defmacro cb/create-keymap (&rest keydefs)
  `(let ((map (make-sparse-keymap)))
     ,@(mapcar #'(lambda (keydef)
                   (let ((key (first keydef)) (def (second keydef)))
                     `(define-key map ,key ,def)))
               keydefs)
     map))

(defmacro cb/global-set-key-with-transient-map (key fn &rest keydefs)
  `(cb/define-key-with-transient-map (current-global-map) ,key ,fn ,@keydefs))

;;; When advising OLDFUN with FUNCTION, where FUNCTION is interactive,
;;; the composed function inherits the interactive specification of
;;; FUNCTION.  Conceptually, the composed function for an :after
;;; advice is equivalent to the following lambda:
;;;
;;; (lambda (&rest r)
;;;   (prog1 (apply OLDFUN r)
;;;     (apply FUNCTION r)))
;;;
;;; In particular, both OLDFUN and FUNCTION will be called with the
;;; same arguments.  If the advised (composed) function is called
;;; interactively and FUNCTION's interactive specification implies a
;;; different number of arguments than OLDFUN we will get an error of
;;; type wrong-number-of-arguments.
;;;
;;; (defun foo () (interactive))
;;; (defun bar (&optional arg) (interactive "P"))
;;; (advice-add 'foo :after 'bar)
;;; (foo)                      ; works
;;; (call-interactively 'foo)  ; wrong-number-of-arguments error
;;;
;;; Therefore in order to advice a function that takes no arguments
;;; using a function that takes one optional argument we have to wrap
;;; the call to the latter function in a lambda taking no arguments.

(provide 'setup-defuns)
