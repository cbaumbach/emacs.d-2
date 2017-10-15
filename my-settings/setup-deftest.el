(defvar *test-name* nil)

(defmacro deftest (name parameters &rest body)
  "Define a test function.  Within a test function we can call
other test functions or use 'check' to run individual test
cases."
  `(defun ,name ,parameters
     (let ((*test-name* (append *test-name* (list ',name))))
       ,@body)))

(defmacro check (&rest forms)
  "Run each expression in 'forms' as a test case."
  `(combine-results
     ,@(cl-loop for f in forms collect `(report-result ,f ',f))))

(defmacro combine-results (&rest forms)
  (let ((result (gensym)))
    `(let ((,result t))
       ,@(cl-loop for f in forms collect `(unless ,f (setf ,result nil)))
       ,result)))

(defun report-result (result form)
  (princ (format "%s ... %s: %s" (if result "pass" "fail") *test-name* form))
  (princ "\n")
  result)

(provide 'setup-deftest)
