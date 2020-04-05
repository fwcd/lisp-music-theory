(in-package :lisp-music-theory)

(defun interval (note iv)
  (make-note
    :class (note-class note)
    :interval (+ (note-interval note) iv)))
