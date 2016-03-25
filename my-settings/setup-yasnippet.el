(require 'yasnippet)

;;; Remove directory with predefined snippets to save space.
(let ((file (locate-library "yasnippet")))
  (if file
      (let ((snippets (concat (file-name-directory file) "snippets")))
        (if (file-directory-p snippets)
            (delete-directory snippets t)))))

;;; Tell yasnippet where to look for user-defined snippets.
(let ((user-snippets (concat user-emacs-directory "snippets")))
  (setq yas-snippet-dirs user-snippets))

(yas-global-mode 1)

;;; Use space to expand snippets (and not tab as per default).
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "SPC") 'yas-expand)

(provide 'setup-yasnippet)
