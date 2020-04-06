# Lisp Music Theory
A music theory library for Common Lisp.

## Installation
Make sure that your ASDF path contains this directory, e.g. by running:

```lisp
(pushnew "/path/to/lisp-music-theory/" asdf:*central-registry*)
```

Then, load the project using:

```lisp
(asdf:load-system :lisp-music-theory)
```

Alternatively, you can configure Quicklisp to find this directory:

```lisp
(pushnew "/path/to/lisp-music-theory/" asdf:*central-registry*)
(ql:register-local-projects)
(ql:quickload :lisp-music-theory)
```

## Usage
To use the project, invoke one of the exported functions. Examples:

```lisp
(lisp-music-theory:note "D4")
(lisp-music-theory:major-triad (lisp-music-theory:note "C2")
(lisp-music-theory:minor-scale (lisp-music-theory:note "C2")
(lisp-music-theory:perfect-fifth (lisp-music-theory:note "C2")
```
