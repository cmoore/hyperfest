;;;; hyperfest.lisp

(in-package #:hyperfest)

(defparameter *site-acceptor* nil)

(defun resource-path (path)
  (asdf:system-relative-pathname :hyperfest path))

(defun stop-server ()
  (hunchentoot:stop *site-acceptor*))

(defun start-server (&key (port 8080))
  (or *site-acceptor*
      (progn
        (setq *site-acceptor* (make-instance 'hunchentoot:easy-acceptor
                                             :port port
                                             :document-root (resource-path "./hyperspec/")))
        (hunchentoot:start *site-acceptor*))))

(defun site-index ()
  (redirect "/Front/X_Master.htm"))

(setq hunchentoot:*dispatch-table*
      (list
       (create-regex-dispatcher "^/$" 'site-index)))
