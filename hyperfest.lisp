;;;; hyperfest.lisp

(in-package #:hyperfest)

(defparameter *hyperfest.site-acceptor* nil)

(defun resource-path (path)
  "Return the full pathname for a directory under a project."
  (asdf:system-relative-pathname :hyperfest path))

(defun stop-server ()
  (and *hyperfest.site-acceptor*
       (ignore-errors
         (hunchentoot:stop *hyperfest.site-acceptor*))))

(defun start-server (&key (port 8080))
  (or *hyperfest.site-acceptor*
      (progn
        (setq *hyperfest.site-acceptor*
              (make-instance 'hunchentoot:easy-acceptor
                             :port port
                             :document-root (resource-path "./hyperspec/")))
        (hunchentoot:start *hyperfest.site-acceptor*))))

(defun site-index ()
  (redirect "/Front/X_Master.htm"))

(setq hunchentoot:*dispatch-table*
      (list
       (create-regex-dispatcher "^/$" 'site-index)))
