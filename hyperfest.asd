;;;; hyperfest.asd

(asdf:defsystem #:hyperfest
  :serial t
  :description "Describe hyperfest here"
  :author "Your Name <your.name@example.com>"
  :license "BSD3"
  :depends-on (#:hunchentoot
               #:cl-who)
  :components ((:file "package")
               (:file "hyperfest")))
