(print "Enter the value of n for factorial")

(defvar x (read))

(defun factorial (x)
(setq fact 1)
(loop
    (setq fact (* fact x))
    (setq x (- x 1))
    (when (= x 1) 
        (format t "Factorial = ~d ~%" fact)
    (return fact))  
)
)
(factorial x)   