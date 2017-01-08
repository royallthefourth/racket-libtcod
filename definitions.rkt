#lang racket/base

(require ffi/unsafe
         ffi/unsafe/define
         "constants.rkt"
         "structs.rkt")

(provide (all-defined-out))

(define-ffi-definer define-libtcod (ffi-lib "libtcod"))

; from libtcod.h
(define _bool _uint8*)

; libtcod.h
; list.h
(define _TCOD_list_t* (_cpointer _void))

; color.h
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