(defsystem "lisp-music-theory"
  :version "0.1.0"
  :author "fwcd"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main")
                 (:file "interval")
                 (:file "note")
                 (:file "utils"))))
  :description ""
  :in-order-to ((test-op (test-op "lisp-music-theory/tests"))))

(defsystem "lisp-music-theory/tests"
  :author ""
  :license ""
  :depends-on ("lisp-music-theory"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for lisp-music-theory"
  :perform (test-op (op c) (symbol-call :rove :run c)))
