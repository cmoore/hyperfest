;;;; hyperfest.lisp

(in-package #:hyperfest)

;;; "hyperfest" goes here. Hacks and glory await!

(defparameter *site-acceptor* nil)

(defun hf-start (&optional port)
  (let* ((the-port (or port 8080))
         (*site-acceptor* (make-instance 'hunchentoot:easy-acceptor
                                         :port the-port
                                         :document-root
                                         (truename
                                          (asdf:system-relative-pathname
                                           :hyperfest "./hyperspec")))))
    (hunchentoot:start *site-acceptor*)))


(defun site-index ()
  (redirect "/Front/X_Master.htm"))

(setq *dispatch-table*
      (list
       (create-regex-dispatcher "^/$" 'site-index)))
