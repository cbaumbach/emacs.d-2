;; Disable Windows key hotkeys in Windows 10
;;
;; Open the registry editor and go to HKEY_CURRENT_USER -> Software ->
;; Microsoft -> Windows -> CurrentVersion -> Policies -> Explorer.  In
;; the right-side pane create a new DWORD named "NoWinKeys" and set
;; its value to 1.  Close the registry editor, log out and back in
;; again.
;;
;; Even after the above registry hack, some Windows key hotkeys are
;; still active.  The following keys can therefore not be used in
;; emacs key bindings that involve the super key:
;;
;;     = + / c f g h i j k l o p u v w x z

(setq w32-lwindow-modifier 'super
      w32-rwindow-modifier 'super
      w32-apps-modifier 'hyper)

(provide 'setup-ms-windows)
