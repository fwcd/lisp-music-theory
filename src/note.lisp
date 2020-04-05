(in-package :lisp-music-theory)

(defstruct note class accidental octave)

; Returns the note with the given octave.
(defun octave (n o)
  (make-note
    :class (note-class n)
    :accidental (note-accidental n)
    :octave NIL))

; Returns the note with the octave 0.
(defun unoctave (n)
  (octave n NIL))

(defun parse-class (c)
  (case (char-downcase c)
    ((#\c) 'c)
    ((#\d) 'd)
    ((#\e) 'e)
    ((#\f) 'f)
    ((#\g) 'g)
    ((#\a) 'a)
    ((#\b) 'b)))

(defun parse-accidental (c)
  (case c
    ((#\#) 'sharp)
    ((#\b) 'flat)))

(defun parse-octave (c)
  (digit-char-p c))

; Parses a note from a string
(defun note (s)
  (make-note
    :class (parse-class (char s 0))
    :accidental (parse-accidental (char s 1))
    :octave (parse-octave (char s (if (> (length s) 2) 2 1)))))
