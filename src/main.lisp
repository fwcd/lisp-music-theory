(defpackage lisp-music-theory
  (:use :cl)
  (:export
    #:note
    #:note-class
    #:note-accidental
    #:note-octave
    #:note-to-semitone
    #:semitone-to-note
    #:interval
    #:minor-second
    #:major-second
    #:minor-third
    #:major-third
    #:perfect-fourth
    #:diminished-fifth
    #:perfect-fifth
    #:minor-sixth
    #:major-sixth
    #:minor-seventh
    #:major-seventh
    #:perfect-octave
    #:major-scale
    #:minor-scale))
(in-package :lisp-music-theory)
