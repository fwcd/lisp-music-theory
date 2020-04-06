(in-package :lisp-music-theory)

(defun chord (root intervals)
  (mapcar (lambda (i) (funcall i root)) intervals))

(defun major-triad (root)
  (chord root (list #'unison #'major-third #'perfect-fifth)))

(defun minor-triad (root)
  (chord root (list #'unison #'minor-third #'perfect-fifth)))
