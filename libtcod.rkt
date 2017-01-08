#lang racket/base

(require ffi/unsafe
         ffi/unsafe/define
         "common.rkt")
(provide (all-defined-out))

(define _bool _uint8*)