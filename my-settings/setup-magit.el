;; Don't show warning message about magit auto revert mode.
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'magit)

;; Disable magit auto revert mode.
(setq magit-auto-revert-mode nil)

;;; Current chunk.
(set-face-foreground 'magit-diff-removed-highlight "brightred")
(set-face-foreground 'magit-diff-added-highlight "brightgreen")
(set-face-background 'magit-diff-removed-highlight "color-235")
(set-face-background 'magit-diff-added-highlight "color-235")
(set-face-background 'magit-diff-context-highlight "black")
(set-face-foreground 'magit-section-highlight "yellow")

;;; Other chunks.
(set-face-foreground 'magit-diff-removed "brightred")
(set-face-foreground 'magit-diff-added "brightgreen")
(set-face-background 'magit-diff-removed "black")
(set-face-background 'magit-diff-added "black")
(set-face-background 'magit-diff-context "black")

;;; Recenter screen after hiding details.
;;;
;;; EXCURSION: When advising OLDFUN with FUNCTION, where FUNCTION is
;;; interactive, the composed function inherits the interactive
;;; specification of FUNCTION.  The composed function for an :after
;;; advice is conceptually equivalent to the following lambda:
;;;
;;;   (lambda (&rest r) (prog1 (apply OLDFUN r) (apply FUNCTION r)))
;;;
;;; In particular, both OLDFUN and FUNCTION will be called with the
;;; same arguments.  If the advised (composed) function is called
;;; interactively and FUNCTION's interactive specification implies a
;;; different number of arguments than OLDFUN we will get an error of
;;; type wrong-number-of-arguments.
;;;
;;; (defun foo ()
;;;   (interactive))
;;;
;;; (defun bar (&optional arg)
;;;   (interactive "P"))
;;;
;;; (advice-add 'foo :after 'bar)
;;;
;;; (foo)                            ; works
;;; (call-interactively 'foo)        ; wrong-number-of-arguments error
;;;
;;; Therefore in order to advise magit-section-show-level-2-all, which
;;; takes no arguments, using recenter-top-bottom, which takes one
;;; optional argument, we have to wrap the latter in a lambda that
;;; takes no arguments.

(advice-add 'magit-section-show-level-2-all :after #'(lambda () (recenter-top-bottom)))
(advice-add 'magit-stage :after #'(lambda (&optional ignored) (recenter-top-bottom 8)))

(provide 'setup-magit)
