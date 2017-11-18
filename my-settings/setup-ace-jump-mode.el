(require 'ace-jump-mode)

(set-face-foreground 'ace-jump-face-foreground "green")
(setq ace-jump-mode-scope 'frame)
(setq ace-jump-mode-case-fold nil)
(setq ace-jump-mode-submode-list
      '(ace-jump-char-mode              ; C-c Space
        ace-jump-word-mode              ; C-u C-c Space
        ace-jump-line-mode))            ; C-u C-u C-c Space

(provide 'setup-ace-jump-mode)
