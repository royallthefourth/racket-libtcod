#lang racket/base

(require "common.rkt" ffi/unsafe)
(provide (all-defined-out))

(define-cstruct _TCOD_color_t ([r _uint8]
                               [g _uint8]
                               [b _uint8]))
; constructors
(define-tcod TCOD_color_RGB (_fun _uint8 _uint8 _uint8 -> _cpointer))
(define-tcod TCOD_color_HSV (_fun _float _float _float -> _cpointer))

; basic operations
(define-tcod TCOD_color_equals (_fun _cpointer _cpointer -> _bool))
(define-tcod TCOD_color_add (_fun _cpointer _cpointer -> _cpointer))
(define-tcod TCOD_color_subtract (_fun _cpointer _cpointer -> _cpointer))
(define-tcod TCOD_color_multiply (_fun _cpointer _float -> _cpointer))
(define-tcod TCOD_color_multiply_scalar (_fun _cpointer _float -> _cpointer))
(define-tcod TCOD_color_lerp (_fun _cpointer _cpointer _float -> _cpointer))

; HSV transformations
(define-tcod TCOD_color_set_HSV (_fun))