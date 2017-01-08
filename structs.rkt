#lang racket/base

(require ffi/unsafe)

(provide (all-defined-out))

; libtcod.h
; list.h
; color.h
(define-cstruct _TCOD_color_t ([r _uint8]
                               [g _uint8]
                               [b _uint8]))

; console.h
; image.h
; mouse.h
; sys.h
; mersenne.h
; bresenham.h
; noise.h
; fov.h
; path.h
; lex.h
; parser.h
; tree.h
; bsp.h
; heightmap.h
; zip.h
; namegen.h
; txtfield.h