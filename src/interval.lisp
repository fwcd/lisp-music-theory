(in-package :lisp-music-theory)

(defun interval (note semis)
  (semitone-to-note (+ (note-to-semitone note) semis)))

; The identity interval
(defun unison (note)
  note)

(defun minor-second (note)
  (interval note 1))

(defun major-second (note)
  (interval note 2))

(defun minor-third (note)
  (interval note 3))

(defun major-third (note)
  (interval note 4))

(defun perfect-fourth (note)
  (interval note 5))

(defun diminished-fifth (note)
  (interval note 6))

(defun perfect-fifth (note)
  (interval note 7))

(defun minor-sixth (note)
  (interval note 8))

(defun major-sixth (note)
  (interval note 9))

(defun minor-seventh (note)
  (interval note 10))

(defun major-seventh (note)
  (interval note 11))

(defun perfect-octave (note)
  (interval note 12))
