; NO OUTPUT SHOULD BE PRODUCED IN THIS FILE

; Returns the roots of the quadratic formula, given
; ax^2+bx+c=0. Return only real roots. The list will
; have 0, 1, or 2 roots. The list of roots should be
; sorted in ascending order.
; a is guaranteed to be non-zero.
; Use the quadratic formula to solve this.
; (quadratic 1.0 0.0 0.0) --> (0.0)
; (quadratic 1.0 3.0 -4.0) --> (-4.0 1.0)
(define (quadratic a b c)
	(cond 
	  ((> (- (* b b) (* 4 (* a c))) 0)
	   (list (/ (- (sqrt (- (* b b) (* (* 4 a) c))) b) (* 2 a)) (/ (- (- (sqrt (- (* b b) (* (* 4 a) c)))) b) (* 2 a))))
	  ((= (- (* b b) (* 4 (* a c))) 0) (list (/ (- (sqrt (- (* b b) (* (* 4 a) c))) b) (* 2 a))))
	  (else 0))
)


; Determines if the volume of one cube is larger than the second.
; (isLargerCube 1 3 4 2 2 2) --> #t
; (isLargerCube 2 2 2 1 3 4) --> #f
(define (isLargerCube length1 width1 depth1 length2 width2 depth2)
(> (*(* length1 width1) depth1) (*(* length2 width2) depth2))
	)
; 
; Ensures that a numeric value stays within a specified range. Values
; that are are within [lowest, highest] are kept. Values that are less
; than the lowest value are clamped to the lowest value. Values that
; exceed the highest value are clamped back to the highest possible.
; value.
; (clamp 0.5 0.0 1.0) --> 0.5
; (clamp -0.5 0.0 1.0) --> 0.0
; (clamp 1.5 0.0 1.0) --> 1.0
(define (clamp value lowest highest)
	(COND
	  ((< value lowest) lowest)
	  ((> value highest) highest)
	  (else value))
)

; Determines if a year is considered a leap year. A leap year is evenly
; divisible by 4, but not 100 (unless it is divisible by 400).
; (isLeapYear 2020) --> #t
; (isLeapYear 2021) --> #f
; (isLeapYear 2100) --> #f
; (isLeapYear 2200) --> #f
; (isLeapYear 2300) --> #f
; (isLeapYear 2400) --> #t
(define (isLeapYear year)
;case 1 - year evenly divisible by 4 and 100 and 400
;case 2 - year evenly divisble by 4, not 100
;case 3 - year not evenly divisble by 4
	(cond 
	  ((zero? (remainder year 400)) #t)
	  ((and (zero? (remainder year 4)) (not (zero? (remainder year 100)))) #t)
	  (else #f))
)

; Accepts a simple list of numbers and returns the list containing only
; the positive numbers, in the order in which they originally appeared.
; (positives '(1 2 9 -2 0 -3 4)) --> (1 2 9 4)
; (positives '()) --> ()
(define (positives lst)
	(cond
	  ((NULL? lst) '())
	  ((> (car lst) 0) (cons (car lst) (positives (cdr lst))))
	  (else (positives(cdr lst))))
)	

; Accepts a flat list of numbers and returns the numbers that
; fall in the range [low, high]. The values will appear in the
; same order that they were in the original list.
; (numsInRange '(1 2 3 4 8 10 -9 8 5) 3 8) --> (3 4 8 8 5)
(define (numsInRange lst low high)
  	(COND
	  ((NULL? lst) '())
	  ((< (car lst) low)(numsInRange (cdr lst) low high))
	  ((> (car lst) high)(numsInRange (cdr lst) low high))
	  (else (cons (car lst) (numsInRange (cdr lst) low high))))
)

; The parameters are two lists. The result should contain the "zip"
; between the two lists. That is, all elements of the first list are paired
; with the corresponding element in the second lists. The result is a
; list of pairs. Assume the two lists are the same length.
; (zip '(1 2 3) '(a b c)) --> ((1 a) (2 b) (3 c))
(define (zip lst1 lst2)
	  (if (or (NULL? lst1) (NULL? lst2)) '() 
  	  (cons (list (car lst1) (car lst2)) (zip (cdr lst1) (cdr lst2))))
)

; Returns the transposition of a 3x3 matrix, where the matrix
; 1 2 3
; 4 5 6
; 7 8 9
; is represented as: ((1 2 3)(4 5 6)(7 8 9))
;(transpose '((1 2 3)(4 5 6)(7 8 9))) --> ((1 4 7)(2 5 8)(3 6 9))
(define (transpose mat)
  	
	(apply map list mat)
	;initially tried using helper method before reviewing map from class
	;(transposeHelper (car mat)(cadr mat)(caddr mat))
)
(define (transposeHelper lst1 lst2 lst3)
	((null? lst1) '())
  	(cons (list (car lst1) (car lst2) (car lst3)) (transposeHelper(cdr lst1)(cdr lst2)(cdr lst3)))
  )
; Returns the list of atoms that appear anywhere in the list,
; including sublists.
; (flatten '(1 2 3)) --> (1 2 3)
; (flatten '(a (b c) ((d e) f))) --> (a b c d e f)
(define (flatten lst)
	(cond ((null? lst) '())
	      ((not (list? lst)) (list lst))
	      (else (append (flatten (car lst)) (flatten (cdr lst)))))
)

; Rewrite this functions using tail recursion. Your function must
; be equivalent to this original one, which does not use tail
; recursion.
; (funcWithTailRecursion 10) --> 55
(define (funcWithTailRecursion n)
  	(funcTRHelper n 0 0)
)
(define (funcTRHelper n total counter)
  	(cond
	  ((< counter n) (funcTRHelper n (+ total counter) (+ counter 1)))
	  ((equal? counter n) (+ total n))) 
 )

; Determines if the BST contains the given value. Use an efficient
; algorithm.
;(BSTContainsValue '(() 4 ()) 4)  --> #t
;(BSTContainsValue '(() 4 ()) 10) --> #f
;(BSTContainsValue '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 12 ())) 10) --> #t
;(BSTContainsValue '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 12 ())) 100) --> #f
;(BSTContainsValue '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 12 ())) 6) --> #t
(define (BSTContainsValue bst value)
  	(cond
	  ((equal? bst '()) #f)
	  ((equal? (cadr bst) value) #t)
	  (BSTContainsValue (car bst) value #t)
	  (BSTContainsValue (cddr bst) value #t)
	  (else #f))
)

; Determines the height of a tree. You may assume the input is a
; legal binary tree.
;(treeHeight '(() 4 ())) --> 1
;(treeHeight '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 12 ()))) --> 4
(define (treeHeight tree)
	0
)

; Returns the new BST that results from adding the new value to the
; tree. You may assume the input is a legal binary tree and the value
; does not appear already in the BST.
;(addToBST '(() 8 ()) 10)) --> (() 8 (() 10 ())) 
;(addToBST '(() 8 ()) 6)) --> ((() 6 ()) 8 ()) 
;(addToBST '(() 8 (() 10())) 9)) --> (() 8 ((() 9 ()) 10 ()))
(define (addToBST bst value)
	bst
)

; Determines if the binary tree is a BST. You may assume the
; input is a legal binary tree.
;(isBST '(() 8 ())) --> #t
;(isBST '((() 4 ()) 8 (() 10 ()))) --> #t
;(isBST '((() 4 ()) 8 (() 0 ()))) --> #f
;(isBST '(() 8 (() 10())))) --> #t
;(isBST '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 12 ()))) --> #t
;(isBST '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 120 ()))) --> #t
;(isBST '((() 4 ()) 6 (((() 8 ()) 9 (() 7 ())) 120 ()))) --> #f
(define (isBST tree)
	#f
)

; Returns the value that results from:
; item1 OP item2 OP .... itemN, evaluated left to right:
; ((item1 OP item2) OP item3) OP ...
; You may assume the list is a flat list that has at least
; one element.
; OP - the operation to be performed
; (accumulate '(1 2 3 4) (lambda (x y) (+ x y))) --> 10
; (accumulate '(1 2 3 4) (lambda (x y) (* x y))) --> 24
; (accumulate '(1) (lambda (x y) (+ x y))) --> 1
(define (accumulate lst OP)
	lst
	; ((list op (car lst) (cadr lst))) + repeat
)

; Similar to apply to all but only the values that satisfy the
; predicate are transformed.
; (conditionalApplyAll '(1 2 3 4 5 6) EVEN? sqr) --> (1 4 3 16 5 36)
(define (conditionalApplyAll lst pred func)
	lst
)

; Returns a function of one parameter (i.e., x) that is equivalent to
; the equation of a line. The function is to be compiled and determined
; by two points (x1, y1) and (x2, y2). It should work like:
;(define L1 (eqOfLine 0.0 0.0 3.0 4.0))
;(L1 0.0) --> 0.0
;(L1 3.0) --> 4.0
;(L1 9.0) --> 12.0
(define (eqOfLine x1 y1 x2 y2)
	(eval '(lambda (x) x) (interaction-environment))
)