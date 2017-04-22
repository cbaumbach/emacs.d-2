;;; Enable all disabled commands.
(setq disabled-command-function nil)

;;; Eliminate long "yes" or "no" prompts.
(fset 'yes-or-no-p 'y-or-n-p)

;;; No backup files, please.
(setq make-backup-files nil)

;;; Don't hide auto-save-list files.
(setq auto-save-list-file-prefix "~/.emacs.d/auto-save-list/saves-")

;;; Save bookmarks inside of .emacs.d.
(setq bookmark-default-file "~/.emacs.d/bookmarks")

;;; Use transient-mark-mode.
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;;; Use delete-selection-mode.
(delete-selection-mode 1)

;;; Increase length of message log.
(setq message-log-max 1000)

;;; Delete previous identical elemens from minibuffer history before
;;; adding new element.
(setq history-delete-duplicates t)

;;; Don't add input matching the last item on the comint input ring.
(setq-default comint-input-ignoredups t)

;;; Set width for formatting man pages.
(setq Man-width 90)

;;; Use xdvi to view dvi files.
(setq-default tex-dvi-view-command "xdvi")

;;; Set printing options.
(setq ps-paper-type 'a4
      ps-font-size 10
      ps-print-header nil
      ps-left-margin 72
      ps-right-margin 72
      ps-bottom-margin 72
      ps-top-margin 72)

;;; Use cperl-mode instead of perl-mode.
(defalias 'perl-mode 'cperl-mode)

;;; Cycle thru buffer-local mark ring with C-u [C-SPC]+.
(setq set-mark-command-repeat-pop 1)

;;; Comment out empty lines.
(setq comment-empty-lines t)

;;; Default input method
(setq default-input-method 'german-postfix)

(provide 'setup-misc)
