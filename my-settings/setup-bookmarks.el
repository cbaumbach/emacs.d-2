;;; Suggest the name of the current bookmark as the default name when
;;; setting a bookmark with `bookmark-set'.  This makes it easy to
;;; update the location of the current bookmark to keep track of
;;; reading progress.
;;;
;;; By default, the name of the current bookmark is among the names
;;; that we can cycle through with M-n when emacs prompts us for a
;;; name for the bookmark.  By moving the name of the current bookmark
;;; to the front of the list of suggestions (`defaults') we make it
;;; the default name and cycling with M-n is no longer necessary.
(advice-add 'bookmark-make-record :filter-return
            #'(lambda (record)
                (when bookmark-current-bookmark
                  (bookmark-prop-set
                   record 'defaults
                   (delete-dups (cons bookmark-current-bookmark
                                      (bookmark-prop-get record 'defaults)))))
                record)
            '((name . suggest-name-of-current-bookmark-as-default-name)))

(provide 'setup-bookmarks)
