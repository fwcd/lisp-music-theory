(in-package :lisp-music-theory)

(defconstant semitones 12)
(defconstant noteclasses (list 'c 'd 'e 'f 'g 'a 'b))
(defconstant unoctaved-notes
  (list (list (note "c0"))
        (list (note "c#0") (note "db0"))
        (list (note "d0"))
        (list (note "d#0") (note "eb0"))
        (list (note "e0"))
        (list (note "f0"))
        (list (note "f#0") (note "gb0"))
        (list (note "g0"))
        (list (note "g#0") (note "ab0"))
        (list (note "a0"))
        (list (note "a#0") (note "bb0"))
        (list (note "b0"))))

(defun unoctaved-note-to-semitone (n)
  (position-if (lambda (ns) (find ns n)) unoctaved-notes))

(defun semitone-to-unoctaved-notes (semitone)
  (nth semitone unoctaved-notes))

(defun note-to-semitone (n)
  (+ (unoctaved-note-to-semitone (unoctave n))
     (* (note-octave n) semitones)))

(defun semitone-to-note (s)
  (let ((semitone (mod s semitones)))
    (octave (semitone-to-unoctaved-note semitone) (/ s semitones))))

(defun pick-enharmonic (notes noteclass)
  (find-if (lambda (n) (equal (note-class n) noteclass)) notes))

(defun diatonic-minor-step (i)
  (case i ((1) 1)
          ((4) 1)
          (otherwise 2)))

(defun diatonic-major-step (i)
  (case i ((2) 1)
          ((6) 1)
          (otherwise 2)))

(defun diatonic-scale (octave semitone i diatonic-step)
  (if (< i (length noteclasses)) (cons (pick-enharmonic (semitone-to-unoctaved-notes semitone) (nth i noteclasses))
                                       (diatonic-scale octave (+ semitone (funcall diatonic-step i)) (+ i 1) diatonic-step))
                                 NIL))

(defun major-scale (octave)
  (diatonic-scale octave 0 0 #'diatonic-major-step))

(defun minor-scale (octave)
  (diatonic-scale octave 0 0 #'diatonic-minor-step))
