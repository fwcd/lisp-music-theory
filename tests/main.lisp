(defpackage lisp-music-theory/tests/main
  (:use :cl
        :lisp-music-theory
        :rove))
(in-package :lisp-music-theory/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :lisp-music-theory)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
