(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)

;;; Make eldoc aware of paredit's most used commands.
(require 'eldoc)                        ; if not already loaded
(eldoc-add-command
 'paredit-backward-delete
 'paredit-close-round)

;;; Use paredit in minibuffer for M-: alias eval-expression.
(if (boundp 'eval-expression-minibuffer-setup-hook)
    (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'minibuffer-setup-hook
            #'(lambda ()
                (if (eq this-command 'eval-expression)
                    (enable-paredit-mode)))))

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "C-c C-s") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "C-c C-b") 'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "C-c s") 'paredit-backward-slurp-sexp)
     (define-key paredit-mode-map (kbd "C-c b") 'paredit-backward-barf-sexp)
     (define-key paredit-mode-map (kbd "DEL") 'paredit-backward-delete-or-delete-region)))

(defun paredit-backward-delete-or-delete-region (&optional n)
  (interactive "P")
  (if (use-region-p)
      (delete-region (region-beginning) (region-end))
    (paredit-backward-delete (prefix-numeric-value n))))

(provide 'setup-paredit-mode)
