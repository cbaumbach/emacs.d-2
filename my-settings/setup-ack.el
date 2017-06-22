(require 'grep)

(defcustom ack-command "ack --with-filename --nofilter --nogroup "
  "Command-line used for `ack' command")

(defun ack (command-args)
  (interactive (list (read-shell-command "Pattern: " nil 'grep-history)))
  (compilation-start (concat ack-command command-args) 'grep-mode))

(provide 'setup-ack)
