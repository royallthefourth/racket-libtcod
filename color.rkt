#lang racket/base

(require "common.rkt" ffi/unsafe)
(provide (all-defined-out))

(define-cstruct _tcod-color-t ([r _uint8]
                               [g _uint8]
                               [b _uint8]))
; constructors
(define-tcod tcod-color-rgb (_fun _uint8 _uint8 _uint8 -> _cpointer) #:c-id TCOD_color_RGB)
(define-tcod tcod-color-hsv (_fun _float _float _float -> _cpointer) #:c-id TCOD_color_HSV)

; basic operations
(define-tcod tcod-color-equals (_fun _cpointer _cpointer -> _bool) #:c-id TCOD_color_equals)
(define-tcod tcod-color-add (_fun _cpointer _cpointer -> _cpointer) #:c-id TCOD_color_add)
(define-tcod tcod-color-subtract (_fun _cpointer _cpointer -> _cpointer) #:c-id TCOD_color_subtract)
(define-tcod tcod-color-multiply (_fun _cpointer _float -> _cpointer) #:c-id TCOD_color_multiply)
(define-tcod tcod-color-multiply-scalar (_fun _cpointer _float -> _cpointer) #:c-id TCOD_color_multiply_scalar)
(define-tcod tcod-color-lerp (_fun _cpointer _cpointer _float -> _cpointer) #:c-id TCOD_color_lerp)

; HSV transformations
;(define-tcod tcod-color-set_HSV (_fun))