(require 'ess-site)

(setq ess-default-style 'C++)

;;; Treat $ like - from a syntax point of view.
(add-hook 'ess-mode-hook #'(lambda () (modify-syntax-entry ?$ "-")))

;;; Always use a SINGLE hash character for comments.
(add-hook 'ess-mode-hook #'(lambda () (setq comment-add 0)))

(setq ess-eval-visibly 'nowait)

(setq ess-S-assign "_")                 ; disable smart "_" key

(setq ess-history-file nil)

;;; Set up a K&R alike indentation style.
(defun cb/ess-indent-k&r ()
  (setq ess-indent-offset 4)
  (setq ess-offset-arguments 'prev-line)
  (setq ess-offset-arguments-newline 'prev-line)
  (setq ess-offset-block 'prev-line)
  (setq ess-offset-continued 'straight)
  (setq ess-align-nested-calls '("ifelse"))
  (setq ess-align-arguments-in-calls nil)
  (setq ess-align-continuations-in-calls '("[ 	]*(" "if[ 	]*(" "[^ 	]+\\["))
  (setq ess-align-blocks '(if-else))
  (setq ess-indent-prev-call-lhs nil)
  (setq ess-indent-prev-call-chains t)
  (setq ess-indent-with-fancy-comments nil))

(add-hook 'ess-mode-hook #'cb/ess-indent-k&r)

;;; Disable font-lock-mode in inferior-ess-mode.
(remove-hook 'inferior-ess-mode-hook #'turn-on-font-lock)
(add-hook 'inferior-ess-mode-hook
          #'(lambda ()
              (font-lock-mode -1)))

(provide 'setup-ess-mode)
