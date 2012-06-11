;;;; hyperfest.lisp

(in-package #:hyperfest)

;;; "hyperfest" goes here. Hacks and glory await!

(defun hf-start (&optional port)
  (let ((the-port (or port
                      8080)))
    (defun resource-path (x)
      (truename
       (asdf:system-relative-pathname :hyperfest x)))
    (setq *site-acceptor*
          (make-instance 'hunchentoot:easy-acceptor
                         :port the-port
                         :document-root (resource-path "./hyperspec")))
    (hunchentoot:start *site-acceptor*)))


(defun site-index ()
  (redirect "/Front/X_Master.htm"))

(setq *dispatch-table*
      (list
       (create-regex-dispatcher "^/$" 'site-index)))
