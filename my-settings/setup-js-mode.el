(require 'js)

(setq-default js-indent-first-init 'dynamic)

;; Install jslint via
;;
;;     sudo apt install nodejs npm
;;     sudo npm install -g jslint

(add-hook 'js-mode-hook
          (lambda ()
            (when buffer-file-name
              (set (make-local-variable 'compile-command)
                   (concat "jslint " (shell-quote-argument (file-name-nondirectory buffer-file-name)))))
            (modify-syntax-entry ?. "-")))  ; treat . like space

(provide 'setup-js-mode)
