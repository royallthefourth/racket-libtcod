#lang info
(define collection "libtcod")
(define deps '("base"
               "rackunit-lib"
               "sdl"))
(define build-deps '("scribble-lib" "racket-doc"))
(define scribblings '(("scribblings/libtcod.scrbl" ())))
(define pkg-desc "An FFI library for the roguelike tool libtcod")
(define version "0.0")
(define pkg-authors '(royall))
