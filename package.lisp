;;;; package.lisp

(defpackage #:hyperfest
  (:nicknames #:hf)
  (:use #:cl
        #:hunchentoot
        #:cl-who)
  (:export #:hf-start))

