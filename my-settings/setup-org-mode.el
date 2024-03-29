(require 'org)

(org-babel-do-load-languages
 'org-babel-load-languages
 `((emacs-lisp . t)
   (R . t)
   (,(if (>= emacs-major-version 26) 'shell 'sh) . t)))

;;; Don't hardcode css style inline, use css selectors instead.
(setq org-html-htmlize-output-type 'css)

;;; Don't evaluate code blocks during export.
(setq org-export-babel-evaluate nil)

;;; Use relative path names when inserting links.
(setq org-link-file-path-type 'relative)

(setq org-edit-src-content-indentation 0)

;;; Add dynamically expanding table of contents in upper right corner.
(setq org-html-head "\
<style type=\"text/css\">
 <!--/*--><![CDATA[/*><!--*/
  #table-of-contents {
      font-size: 9pt;
      position: fixed;
      right: 0em;
      top: 0em;
      background: white;
      text-align: right;
      max-height: 80%;
      overflow: auto;
      z-index: 200;
  }
  #table-of-contents #text-table-of-contents {
      display: none;
      text-align: left;
  }
  #table-of-contents:hover #text-table-of-contents {
      display: block;
      padding: 0.5em;
      margin-top: -1.5em;
  }
  @media screen
  {
    #table-of-contents {
      float: right;
      border: 1px solid #CCC;
      max-width: 50%;
      overflow: auto;
    }
  } /* END OF @media screen */
 /*]]>*/-->
</style>")

(add-hook 'org-mode-hook 'turn-on-auto-fill)

(defun cb/org-toggle-skip-confirm-babel-evaluate ()
  "Toggle flag to bypass the need for confirmation when
evaluating source blocks."
  (interactive)
  (setq org-skip-confirm-babel-evaluate
        (not org-skip-confirm-babel-evaluate))
  (message "%s for confirmation when evaluating source blocks"
           (if org-skip-confirm-babel-evaluate
               "Don't ask" "Ask")))

(add-hook 'org-mode-hook
          #'(lambda ()
              (setq-local org-skip-confirm-babel-evaluate nil)
              (local-set-key (kbd "C-c M-s") 'cb/org-toggle-skip-confirm-babel-evaluate)
              (local-set-key (kbd "C-a") 'cb/move-beginning-of-line-or-buffer)
              (local-set-key (kbd "C-e") 'cb/move-end-of-line-or-buffer)))

(setq org-confirm-babel-evaluate
      #'(lambda (lang body)
          (not (or
                org-skip-confirm-babel-evaluate
                (string= lang "emacs-lisp")
                (string= lang "R")))))

(provide 'setup-org-mode)
