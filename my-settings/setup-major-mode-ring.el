(require 'ring)

(defvar *major-mode-ring* (make-ring 4)
  "Ring buffer to hold up to 4 major modes thru which we can cycle")

;;; INVARIANT: At any moment, we consider the current major mode to be
;;; the ring's head element.  If the current major mode is not already
;;; in the ring, we insert it.

(defun ensure-major-mode-in-ring ()
  (if (not (ring-member *major-mode-ring* major-mode))
      (ring-insert *major-mode-ring* major-mode)))

(defun major-mode-ring-add ()
  "Add current major mode to ring"
  (interactive)
  (ensure-major-mode-in-ring)
  (princ major-mode))

(defun major-mode-ring-next ()
  "Change to next major mode"
  (interactive)
  (ensure-major-mode-in-ring)
  (funcall (ring-next *major-mode-ring* major-mode))
  (princ major-mode))

(defun major-mode-ring-previous ()
  "Change to previous major mode"
  (interactive)
  (ensure-major-mode-in-ring)
  (funcall (ring-previous *major-mode-ring* major-mode))
  (princ major-mode))

(defun major-mode-ring-remove ()
  "Remove current major mode from ring"
  (interactive)
  (let ((index (ring-member *major-mode-ring* major-mode)))
    (if index
        (progn
          (ring-remove *major-mode-ring* index)
          (funcall (ring-ref *major-mode-ring* 0)))))
  (princ major-mode))

(defun major-mode-ring-show ()
  "Show all major modes in ring"
  (interactive)
  (ensure-major-mode-in-ring)
  (let ((start (ring-member *major-mode-ring* major-mode))
        (result))
    (dotimes (index (ring-length *major-mode-ring*) (princ result))
      (let* ((mode (ring-ref *major-mode-ring* index))
             (mode-symbol (if (equal mode major-mode)
                              (intern (upcase (symbol-name mode)))
                            mode)))
        (setf result (cons mode-symbol result))))))

(provide 'setup-major-mode-ring)
