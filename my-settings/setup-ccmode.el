(defconst my-c-style
  '((c-basic-offset . 4)
    (c-comment-prefix-regexp
     (awk-mode . "#+")
     (other . "//+\\|\\**"))
    (c-block-comment-prefix . "  ")
    (c-backslash-column . 0)
    (c-backslash-max-column . 999)
    (c-ignore-auto-fill string cpp code)
    (c-hanging-braces-alist
     (block-close before)
     (block-open after)
     (brace-entry-open)
     (brace-list-close before after)
     (brace-list-open)
     (class-close before after)
     (class-open after)
     (composition-close before after)
     (composition-open after)
     (defun-close before after)
     (defun-open after)
     (extern-lang-close before after)
     (extern-lang-open after)
     (inexpr-class-close before after)
     (inexpr-class-open after)
     (inline-close before after)
     (inline-open after)
     (module-close before after)
     (module-open after)
     (namespace-close before after)
     (namespace-open after)
     (statement-case-open after)
     (substatement-open . c-braces-no-newlines-before-nonblanks))
    (c-hanging-colons-alist
     (case-label after)
     (label after)
     (access-label after)
     (member-init-intro)
     (inher-intro))
    (c-hanging-semi&comma-criteria
     c-semi&comma-no-newlines-for-oneline-inliners
     c-semi&comma-no-newlines-before-nonblanks
     c-semi&comma-inside-parenlist)
    (c-cleanup-list
     brace-else-brace
     brace-elseif-brace
     brace-catch-brace
     defun-close-semi
     list-close-comma
     scope-operator)
    (c-comment-only-line-offset 0 . 0)
    (c-syntactic-indentation-in-macros . t)
    (c-offsets-alist
     (access-label . -)
     (annotation-top-cont . 0)
     (annotation-var-cont . 0)
     (arglist-close . -)
     (arglist-cont . 0)
     (arglist-cont-nonempty . +)
     (arglist-intro . +)
     (block-close . 0)
     (block-open . 0)
     (brace-entry-open . 0)
     (brace-list-close . 0)
     (brace-list-entry . 0)
     (brace-list-intro . +)
     (brace-list-open . 0)
     (c . c-lineup-C-comments)
     (case-label . 0)
     (catch-clause . 0)
     (class-close . 0)
     (class-open . 0)
     (comment-intro c-lineup-comment)
     (composition-close . 0)
     (composition-open . 0)
     (cpp-define-intro . +)
     (cpp-macro . [0])
     (cpp-macro-cont . +)
     (defun-block-intro . +)
     (defun-close . 0)
     (defun-open . 0)
     (do-while-closure . 0)
     (else-clause . 0)
     (extern-lang-close . 0)
     (extern-lang-open . 0)
     (friend . 0)
     (func-decl-cont . +)
     (inclass . +)
     (incomposition . +)
     (inexpr-class . +)
     (inexpr-statement . 0)
     (inextern-lang . +)
     (inher-cont . c-lineup-multi-inher)
     (inher-intro . +)
     (inlambda . +)
     (inline-close . 0)
     (inline-open . 0)
     (inmodule . +)
     (innamespace . +)
     (knr-argdecl . 0)
     (knr-argdecl-intro . +)
     (label . *)
     (lambda-intro-cont . +)
     (member-init-cont . c-lineup-multi-inher)
     (member-init-intro . +)
     (module-close . 0)
     (module-open . 0)
     (namespace-close . 0)
     (namespace-open . 0)
     (objc-method-args-cont . +)
     (objc-method-call-cont . +)
     (objc-method-intro . [0])
     (statement . 0)
     (statement-block-intro . +)
     (statement-case-intro . +)
     (statement-case-open . +)
     (statement-cont . +)
     (stream-op . +)
     (string . c-lineup-dont-change)
     (substatement . +)
     (substatement-label . *)
     (substatement-open . 0)
     (template-args-cont . +)
     (topmost-intro . 0)
     (topmost-intro-cont . 0))))

(defun c-braces-no-newlines-before-nonblanks (syntax pos)
  (save-excursion
    (if (and (= (c-last-command-char) ?\{)
             (zerop (forward-line 1))
             (bolp)			; forward-line has funny behavior at eob.
             (not (looking-at "^[ \t]*$")))
        nil
      '(after))))

(c-add-style "personal" my-c-style)

(add-hook 'c-mode-common-hook
          #'(lambda ()
              (c-set-style "personal")
              (setq c-auto-align-backslashes nil)
              (c-toggle-syntactic-indentation 1)
              ; (c-toggle-auto-newline 1)
              ; (c-toggle-hungry-state 1)
              (c-toggle-electric-state 1)))

;;; Use // for comments in C code.
(add-hook 'c-mode-hook
          #'(lambda ()
              (setq comment-start "//")
              (setq comment-padding " ")
              (setq comment-end "")))

(provide 'setup-ccmode)
