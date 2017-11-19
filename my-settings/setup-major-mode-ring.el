(require 'ring)

(defvar cb/major-mode-ring (make-ring 4)
  "Ring buffer to hold up to 4 major modes thru which we can cycle")

;;; INVARIANT: At any moment, we consider the current major mode to be
;;; the ring's head element.  If the current major mode is not already
;;; in the ring, we insert it.

(defun cb/ensure-major-mode-in-ring ()
  (if (not (ring-member cb/major-mode-ring major-mode))
      (ring-insert cb/major-mode-ring major-mode)))

(defun cb/major-mode-ring-add ()
  "Add current major mode to ring"
  (interactive)
  (cb/ensure-major-mode-in-ring)
  (princ major-mode))

(defun cb/major-mode-ring-next ()
  "Change to next major mode"
  (interactive)
  (cb/ensure-major-mode-in-ring)
  (funcall (ring-next cb/major-mode-ring major-mode))
  (princ major-mode))

(defun cb/major-mode-ring-previous ()
  "Change to previous major mode"
  (interactive)
  (cb/ensure-major-mode-in-ring)
  (funcall (ring-previous cb/major-mode-ring major-mode))
  (princ major-mode))

(defun cb/major-mode-ring-remove ()
  "Remove current major mode from ring"
  (interactive)
  (let ((index (ring-member cb/major-mode-ring major-mode)))
    (if index
        (progn
          (ring-remove cb/major-mode-ring index)
          (funcall (ring-ref cb/major-mode-ring 0)))))
  (princ major-mode))

(defun cb/major-mode-ring-show ()
  "Show all major modes in ring"
  (interactive)
  (cb/ensure-major-mode-in-ring)
  (let ((start (ring-member cb/major-mode-ring major-mode))
        (result))
    (dotimes (index (ring-length cb/major-mode-ring) (princ result))
      (let* ((mode (ring-ref cb/major-mode-ring index))
             (mode-symbol (if (equal mode major-mode)
                              (intern (upcase (symbol-name mode)))
                            mode)))
        (setf result (cons mode-symbol result))))))

(provide 'setup-major-mode-ring)
