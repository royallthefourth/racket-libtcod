#lang racket/base

(require ffi/unsafe
         ffi/unsafe/define
         "common.rkt"
         "list.rkt"
         "color.rkt"
         "console.rkt"
         "image.rkt")
(provide (all-defined-out))

(define _bool _uint8*)