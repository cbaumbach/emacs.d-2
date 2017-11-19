(defvar *test-name* nil)

(defmacro cb/deftest (name parameters &rest body)
  "Define a test function.  Within a test function we can call
other test functions or use 'cb/check' to run individual test
cases."
  `(defun ,name ,parameters
     (let ((*test-name* (append *test-name* (list ',name))))
       ,@body)))

(defmacro cb/check (&rest forms)
  "Run each expression in 'forms' as a test case."
  `(cb/combine-results
     ,@(cl-loop for f in forms collect `(cb/report-result ,f ',f))))

(defmacro cb/combine-results (&rest forms)
  (let ((result (gensym)))
    `(let ((,result t))
       ,@(cl-loop for f in forms collect `(unless ,f (setf ,result nil)))
       ,result)))

(defun cb/report-result (result form)
  (princ (format "%s ... %s: %s" (if result "pass" "fail") *test-name* form))
  (princ "\n")
  result)

(provide 'setup-deftest)
