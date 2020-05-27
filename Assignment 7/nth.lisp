(print "Enter the value of n - index of list")

(defvar x (read))

(defun get-n (x)
(format t "Nth element of list = ~d ~%" (nth x (list 12 45 89 34 8 1 40 100)))
)   
(get-n x)