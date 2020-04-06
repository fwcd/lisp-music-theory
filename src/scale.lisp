(in-package :lisp-music-theory)

(defconstant semitones 12)
(defconstant noteclasses (list :c :d :e :f :g :a :b))
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
  (position-if (lambda (ns) (find-if (lambda (m) (equalp n m)) ns)) unoctaved-notes))

(defun semitone-to-unoctaved-notes (semitone)
  (nth semitone unoctaved-notes))

(defun pick-enharmonic (notes noteclass)
  (find-if (lambda (n) (equal (note-class n) noteclass)) notes))

(defun note-to-semitone (n)
  (+ (unoctaved-note-to-semitone (unoctave n))
     (* (note-octave n) semitones)))

(defun semitone-to-note (s)
  (let ((semitone (mod s semitones)))
    (octave
      (first (semitone-to-unoctaved-notes semitone))
      (floor s semitones))))

(defun diatonic-minor-step (i)
  (case i ((1) 1)
          ((4) 1)
          (otherwise 2)))

(defun diatonic-major-step (i)
  (case i ((2) 1)
          ((6) 1)
          (otherwise 2)))

(defun generate-diatonic-scale (o semitone base i diatonic-step)
  (if (< i (length noteclasses))
    (cons (octave (let ((noteclass (nth (mod (+ base i) (length noteclasses)) noteclasses))
                        (enharmonic-notes (semitone-to-unoctaved-notes (mod semitone semitones))))
                    (or (pick-enharmonic enharmonic-notes noteclass)
                        (first enharmonic-notes)))
                  (+ o (floor semitone semitones)))
          (generate-diatonic-scale o (+ semitone (funcall diatonic-step i)) base (+ i 1) diatonic-step))
    NIL))

(defun diatonic-scale (key diatonic-step)
  (generate-diatonic-scale
    (note-octave key)
    (unoctaved-note-to-semitone (unoctave key))
    (position (note-class key) noteclasses)
    0
    diatonic-step))

(defun major-scale (key)
  (diatonic-scale key #'diatonic-major-step))

(defun minor-scale (key)
  (diatonic-scale key #'diatonic-minor-step))
