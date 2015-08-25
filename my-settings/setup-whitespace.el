;;; No more trailing whitespace.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Every _saved_ file ends in one ...
(setq-default require-final-newline t)

;;; ... and only one newline.
(add-hook 'before-save-hook
          #'(lambda ()
              (save-excursion
                (save-restriction ; restore narrowed view
                  (goto-char (point-max))
                  (delete-blank-lines)))))

;;; Never insert tabs.
(setq-default indent-tabs-mode nil)

;;; Use 4-space tabs.
(setq-default tab-width 4)

;;; Use two spaces after a colon.
(setq colon-double-space t)

(provide 'setup-whitespace)
