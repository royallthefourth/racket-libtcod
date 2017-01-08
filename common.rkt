#lang racket/base

(require ffi/unsafe
         ffi/unsafe/define)
(provide (all-defined-out))

; pointer type helpers
(define-cpointer-type _uint8*)
(define-cpointer-type _int8*)
(define-cpointer-type _uint16*)
(define-cpointer-type _int16*)
(define-cpointer-type _uint32*)
(define-cpointer-type _int32*)
(define-cpointer-type _int*)
(define-cpointer-type _uint*)
(define-cpointer-type _float*)
(define-cpointer-type _void*)

(define-ffi-definer define-tcod (ffi-lib "libtcod" '("1.6" #f)))
