(require 'grep)

(defcustom ack-command "ack --with-filename --nofilter --nogroup "
  "Command-line used for `ack' command")

(defun ack (directory pattern)
  (interactive
   (list
    (read-directory-name "Directory: ")
    (read-string "Pattern: " nil 'grep-history)))
  (compilation-start (format "%s %s %s" ack-command pattern directory) 'grep-mode))

(provide 'setup-ack)
