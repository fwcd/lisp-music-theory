(in-package :lisp-music-theory)

(defun interval (note interval)
  (make-note
    :class (note-class note)
    :accidental ()
    :interval (+ (note-interval note) interval)))

; The identity interval
(defun unison (note)
  note)
