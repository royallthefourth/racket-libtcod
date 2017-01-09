#lang racket/base

(require "common.rkt" ffi/unsafe)
(provide (all-defined-out))

(define-cstruct _tcod-color-t ([r _uint8]
                               [g _uint8]
                               [b _uint8]))

(define _color-names
  (_enum '(tcod-color-red
           tcod-color-flame
           tcod-color-organge
           tcod-color-amber
           tcod-color-yellow
           tcod-color-lime
           tcod-color-chartreuse
           tcod-color-green
           tcod-color-sea
           tcod-color-turqoise
           tcod-color-cyan
           tcod-color-sky
           tcod-color-azure
           tcod-color-blue
           tcod-color-han
           tcod-color-violet
           tcod-color-purple
           tcod-color-fuschia
           tcod-color-magenta
           tcod-color-pink
           tcod-color-crimson
           tcod-color-nb)))
(define _color-levels
  (_enum '(tcod-color-desaturated
           tcod-color-lightest
           tcod-color-lighter
           tcod-color-light
           tcod-color-normal
           tcod-color-dark
           tcod-color-darker
           tcod-color-darkest
           tcod-color-levels)))

; constructors
(define-tcod tcod-color-rgb (_fun (r : _uint8) (g : _uint8) (b : _uint8) -> _tcod-color-t) #:c-id TCOD_color_RGB)
(define-tcod tcod-color-hsv (_fun (r : _float) (g : _float) (b : _float) -> _tcod-color-t) #:c-id TCOD_color_HSV)

; basic operations
(define-tcod tcod-color-equals (_fun _tcod-color-t _tcod-color-t -> _bool) #:c-id TCOD_color_equals)
(define-tcod tcod-color-add (_fun _tcod-color-t _tcod-color-t -> _tcod-color-t) #:c-id TCOD_color_add)
(define-tcod tcod-color-subtract (_fun _tcod-color-t _tcod-color-t -> _tcod-color-t) #:c-id TCOD_color_subtract)
(define-tcod tcod-color-multiply (_fun _tcod-color-t _tcod-color-t -> _tcod-color-t) #:c-id TCOD_color_multiply)
(define-tcod tcod-color-multiply-scalar (_fun _tcod-color-t _float -> _tcod-color-t) #:c-id TCOD_color_multiply_scalar)
(define-tcod tcod-color-lerp (_fun _tcod-color-t _tcod-color-t (coef : _float) -> _tcod-color-t) #:c-id TCOD_color_lerp)

; HSV transformations
(define-tcod tcod-color-set-hsv (_fun _tcod-color-t-pointer (hue : _float) (saturation : _float) (value : _float) -> _void) #:c-id TCOD_color_set_HSV)
(define-tcod tcod-color-get-hsv (_fun _tcod-color-t (hue : _float*) (saturation : _float*) (value : _float*) -> _void) #:c-id TCOD_color_get_HSV)
(define-tcod tcod-color-get-hue (_fun _tcod-color-t -> _float) #:c-id TCOD_color_get_hue)
(define-tcod tcod-color-set-hue (_fun _tcod-color-t-pointer (hue : _float) -> _void) #:c-id TCOD_color_set_hue)
(define-tcod tcod-color-get-saturation (_fun _tcod-color-t -> _float) #:c-id TCOD_color_get_saturation)
(define-tcod tcod-color-set-saturation (_fun _tcod-color-t-pointer (saturation : _float) -> _void) #:c-id TCOD_color_set_saturation)
(define-tcod tcod-color-get-value (_fun _tcod-color-t -> _float) #:c-id TCOD_color_get_value)
(define-tcod tcod-color-set-value (_fun _tcod-color-t-pointer (value : _float) -> _void) #:c-id TCOD_color_set_value)
(define-tcod tcod-color-shift-hue (_fun _tcod-color-t-pointer (s : _float) -> _void) #:c-id TCOD_color_shift_hue)
(define-tcod tcod-color-scale-hsv (_fun _tcod-color-t-pointer (hue : _float*) (saturation : _float*) -> _void) #:c-id TCOD_color_scale_HSV)

; color map
(define-tcod tcod-color-gen-map (_fun (map : _tcod-color-t-pointer) (nb-key : _int) (key-color : _tcod-color-t-pointer) (key-index : _int*) -> _void) #:c-id TCOD_color_gen_map)

; color names
(define tcod-black (tcod-color-rgb 0 0 0))
(define tcod-darkest-grey (tcod-color-rgb 31 31 31))
(define tcod-darker-grey (tcod-color-rgb 63 63 63))
(define tcod-dark-grey (tcod-color-rgb 95 95 95))
(define tcod-grey (tcod-color-rgb 127 127 127))
(define tcod-light-grey (tcod-color-rgb 159 159 159))
(define tcod-lighter-grey (tcod-color-rgb 191 191 191))
(define tcod-lightest-grey (tcod-color-rgb 223 223 223))
(define tcod-white (tcod-color-rgb 255 255 255))

(define tcod-darkest-sepia (tcod-color-rgb 31 24 15))
(define tcod-darker-sepia (tcod-color-rgb 63 50 31))
(define tcod-dark-sepia (tcod-color-rgb 94 75 47))
(define tcod-sepia (tcod-color-rgb 127 101 63))
(define tcod-light-sepia (tcod-color-rgb 158 134 100))
(define tcod-lighter-sepia (tcod-color-rgb 191 171 143))
(define tcod-lightest-sepia (tcod-color-rgb 222 211 195))

; desaturated
(define tcod-desaturated-red (tcod-color-rgb 127 63 63))
(define tcod-desaturated-flame (tcod-color-rgb 127 79 63))
(define tcod-desaturated-orange (tcod-color-rgb 127 95 63))
(define tcod-desaturated-amber (tcod-color-rgb 127 111 63))
(define tcod-desaturated-yellow (tcod-color-rgb 127 127 63))
(define tcod-desaturated-lime (tcod-color-rgb 111 127 63))
(define tcod-desaturated-chartreuse (tcod-color-rgb 95 127 63))
(define tcod-desaturated-green (tcod-color-rgb 63 127 63))
(define tcod-desaturated-sea (tcod-color-rgb 63 127 95))
(define tcod-desaturated-turquoise (tcod-color-rgb 63 127 111))
(define tcod-desaturated-cyan (tcod-color-rgb 63 127 127))
(define tcod-desaturated-sky (tcod-color-rgb 63 111 127))
(define tcod-desaturated-azure (tcod-color-rgb 63 95 127))
(define tcod-desaturated-blue (tcod-color-rgb 63 63 127))
(define tcod-desaturated-han (tcod-color-rgb 79 63 127))
(define tcod-desaturated-violet (tcod-color-rgb 95 63 127))
(define tcod-desaturated-purple (tcod-color-rgb 111 63 127))
(define tcod-desaturated-fuchsia (tcod-color-rgb 127 63 127))
(define tcod-desaturated-magenta (tcod-color-rgb 127 63 111))
(define tcod-desaturated-pink (tcod-color-rgb 127 63 95))
(define tcod-desaturated-crimson (tcod-color-rgb 127 63 79))

; lightest
(define tcod-lightest-red (tcod-color-rgb 255 191 191))
(define tcod-lightest-flame (tcod-color-rgb 255 207 191))
(define tcod-lightest-orange (tcod-color-rgb 255 223 191))
(define tcod-lightest-amber (tcod-color-rgb 255 239 191))
(define tcod-lightest-yellow (tcod-color-rgb 255 255 191))
(define tcod-lightest-lime (tcod-color-rgb 239 255 191))
(define tcod-lightest-chartreuse (tcod-color-rgb 223 255 191))
(define tcod-lightest-green (tcod-color-rgb 191 255 191))
(define tcod-lightest-sea (tcod-color-rgb 191 255 223))
(define tcod-lightest-turquoise (tcod-color-rgb 191 255 239))
(define tcod-lightest-cyan (tcod-color-rgb 191 255 255))
(define tcod-lightest-sky (tcod-color-rgb 191 239 255))
(define tcod-lightest-azure (tcod-color-rgb 191 223 255))
(define tcod-lightest-blue (tcod-color-rgb 191 191 255))
(define tcod-lightest-han (tcod-color-rgb 207 191 255))
(define tcod-lightest-violet (tcod-color-rgb 223 191 255))
(define tcod-lightest-purple (tcod-color-rgb 239 191 255))
(define tcod-lightest-fuchsia (tcod-color-rgb 255 191 255))
(define tcod-lightest-magenta (tcod-color-rgb 255 191 239))
(define tcod-lightest-pink (tcod-color-rgb 255 191 223))
(define tcod-lightest-crimson (tcod-color-rgb 255 191 207))

; lighter
(define tcod-lighter-red (tcod-color-rgb 255 127 127))
(define tcod-lighter-flame (tcod-color-rgb 255 159 127))
(define tcod-lighter-orange (tcod-color-rgb 255 191 127))
(define tcod-lighter-amber (tcod-color-rgb 255 223 127))
(define tcod-lighter-yellow (tcod-color-rgb 255 255 127))
(define tcod-lighter-lime (tcod-color-rgb 223 255 127))
(define tcod-lighter-chartreuse (tcod-color-rgb 191 255 127))
(define tcod-lighter-green (tcod-color-rgb 127 255 127))
(define tcod-lighter-sea (tcod-color-rgb 127 255 191))
(define tcod-lighter-turquoise (tcod-color-rgb 127 255 223))
(define tcod-lighter-cyan (tcod-color-rgb 127 255 255))
(define tcod-lighter-sky (tcod-color-rgb 127 223 255))
(define tcod-lighter-azure (tcod-color-rgb 127 191 255))
(define tcod-lighter-blue (tcod-color-rgb 127 127 255))
(define tcod-lighter-han (tcod-color-rgb 159 127 255))
(define tcod-lighter-violet (tcod-color-rgb 191 127 255))
(define tcod-lighter-purple (tcod-color-rgb 223 127 255))
(define tcod-lighter-fuchsia (tcod-color-rgb 255 127 255))
(define tcod-lighter-magenta (tcod-color-rgb 255 127 223))
(define tcod-lighter-pink (tcod-color-rgb 255 127 191))
(define tcod-lighter-crimson (tcod-color-rgb 255 127 159))

; light
(define tcod-light-red (tcod-color-rgb 255 63 63))
(define tcod-light-flame (tcod-color-rgb 255 111 63))
(define tcod-light-orange (tcod-color-rgb 255 159 63))
(define tcod-light-amber (tcod-color-rgb 255 207 63))
(define tcod-light-yellow (tcod-color-rgb 255 255 63))
(define tcod-light-lime (tcod-color-rgb 207 255 63))
(define tcod-light-chartreuse (tcod-color-rgb 159 255 63))
(define tcod-light-green (tcod-color-rgb 63 255 63))
(define tcod-light-sea (tcod-color-rgb 63 255 159))
(define tcod-light-turquoise (tcod-color-rgb 63 255 207))
(define tcod-light-cyan (tcod-color-rgb 63 255 255))
(define tcod-light-sky (tcod-color-rgb 63 207 255))
(define tcod-light-azure (tcod-color-rgb 63 159 255))
(define tcod-light-blue (tcod-color-rgb 63 63 255))
(define tcod-light-han (tcod-color-rgb 111 63 255))
(define tcod-light-violet (tcod-color-rgb 159 63 255))
(define tcod-light-purple (tcod-color-rgb 207 63 255))
(define tcod-light-fuchsia (tcod-color-rgb 255 63 255))
(define tcod-light-magenta (tcod-color-rgb 255 63 207))
(define tcod-light-pink (tcod-color-rgb 255 63 159))
(define tcod-light-crimson (tcod-color-rgb 255 63 111))

; normal
(define tcod-red (tcod-color-rgb 255 0 0))
(define tcod-flame (tcod-color-rgb 255 63 0))
(define tcod-orange (tcod-color-rgb 255 127 0))
(define tcod-amber (tcod-color-rgb 255 191 0))
(define tcod-yellow (tcod-color-rgb 255 255 0))
(define tcod-lime (tcod-color-rgb 191 255 0))
(define tcod-chartreuse (tcod-color-rgb 127 255 0))
(define tcod-green (tcod-color-rgb 0 255 0))
(define tcod-sea (tcod-color-rgb 0 255 127))
(define tcod-turquoise (tcod-color-rgb 0 255 191))
(define tcod-cyan (tcod-color-rgb 0 255 255))
(define tcod-sky (tcod-color-rgb 0 191 255))
(define tcod-azure (tcod-color-rgb 0 127 255))
(define tcod-blue (tcod-color-rgb 0 0 255))
(define tcod-han (tcod-color-rgb 63 0 255))
(define tcod-violet (tcod-color-rgb 127 0 255))
(define tcod-purple (tcod-color-rgb 191 0 255))
(define tcod-fuchsia (tcod-color-rgb 255 0 255))
(define tcod-magenta (tcod-color-rgb 255 0 191))
(define tcod-pink (tcod-color-rgb 255 0 127))
(define tcod-crimson (tcod-color-rgb 255 0 63))

; dark
(define tcod-dark-red (tcod-color-rgb 191 0 0))
(define tcod-dark-flame (tcod-color-rgb 191 47 0))
(define tcod-dark-orange (tcod-color-rgb 191 95 0))
(define tcod-dark-amber (tcod-color-rgb 191 143 0))
(define tcod-dark-yellow (tcod-color-rgb 191 191 0))
(define tcod-dark-lime (tcod-color-rgb 143 191 0))
(define tcod-dark-chartreuse (tcod-color-rgb 95 191 0))
(define tcod-dark-green (tcod-color-rgb 0 191 0))
(define tcod-dark-sea (tcod-color-rgb 0 191 95))
(define tcod-dark-turquoise (tcod-color-rgb 0 191 143))
(define tcod-dark-cyan (tcod-color-rgb 0 191 191))
(define tcod-dark-sky (tcod-color-rgb 0 143 191))
(define tcod-dark-azure (tcod-color-rgb 0 95 191))
(define tcod-dark-blue (tcod-color-rgb 0 0 191))
(define tcod-dark-han (tcod-color-rgb 47 0 191))
(define tcod-dark-violet (tcod-color-rgb 95 0 191))
(define tcod-dark-purple (tcod-color-rgb 143 0 191))
(define tcod-dark-fuchsia (tcod-color-rgb 191 0 191))
(define tcod-dark-magenta (tcod-color-rgb 191 0 143))
(define tcod-dark-pink (tcod-color-rgb 191 0 95))
(define tcod-dark-crimson (tcod-color-rgb 191 0 47))

; darker
(define tcod-darker-red (tcod-color-rgb 127 0 0))
(define tcod-darker-flame (tcod-color-rgb 127 31 0))
(define tcod-darker-orange (tcod-color-rgb 127 63 0))
(define tcod-darker-amber (tcod-color-rgb 127 95 0))
(define tcod-darker-yellow (tcod-color-rgb 127 127 0))
(define tcod-darker-lime (tcod-color-rgb 95 127 0))
(define tcod-darker-chartreuse (tcod-color-rgb 63 127 0))
(define tcod-darker-green (tcod-color-rgb 0 127 0))
(define tcod-darker-sea (tcod-color-rgb 0 127 63))
(define tcod-darker-turquoise (tcod-color-rgb 0 127 95))
(define tcod-darker-cyan (tcod-color-rgb 0 127 127))
(define tcod-darker-sky (tcod-color-rgb 0 95 127))
(define tcod-darker-azure (tcod-color-rgb 0 63 127))
(define tcod-darker-blue (tcod-color-rgb 0 0 127))
(define tcod-darker-han (tcod-color-rgb 31 0 127))
(define tcod-darker-violet (tcod-color-rgb 63 0 127))
(define tcod-darker-purple (tcod-color-rgb 95 0 127))
(define tcod-darker-fuchsia (tcod-color-rgb 127 0 127))
(define tcod-darker-magenta (tcod-color-rgb 127 0 95))
(define tcod-darker-pink (tcod-color-rgb 127 0 63))
(define tcod-darker-crimson (tcod-color-rgb 127 0 31))

; darkest
(define tcod-darkest-red (tcod-color-rgb 63 0 0))
(define tcod-darkest-flame (tcod-color-rgb 63 15 0))
(define tcod-darkest-orange (tcod-color-rgb 63 31 0))
(define tcod-darkest-amber (tcod-color-rgb 63 47 0))
(define tcod-darkest-yellow (tcod-color-rgb 63 63 0))
(define tcod-darkest-lime (tcod-color-rgb 47 63 0))
(define tcod-darkest-chartreuse (tcod-color-rgb 31 63 0))
(define tcod-darkest-green (tcod-color-rgb 0 63 0))
(define tcod-darkest-sea (tcod-color-rgb 0 63 31))
(define tcod-darkest-turquoise (tcod-color-rgb 0 63 47))
(define tcod-darkest-cyan (tcod-color-rgb 0 63 63))
(define tcod-darkest-sky (tcod-color-rgb 0 47 63))
(define tcod-darkest-azure (tcod-color-rgb 0 31 63))
(define tcod-darkest-blue (tcod-color-rgb 0 0 63))
(define tcod-darkest-han (tcod-color-rgb 15 0 63))
(define tcod-darkest-violet (tcod-color-rgb 31 0 63))
(define tcod-darkest-purple (tcod-color-rgb 47 0 63))
(define tcod-darkest-fuchsia (tcod-color-rgb 63 0 63))
(define tcod-darkest-magenta (tcod-color-rgb 63 0 47))
(define tcod-darkest-pink (tcod-color-rgb 63 0 31))
(define tcod-darkest-crimson (tcod-color-rgb 63 0 15))

; metallic
(define tcod-brass (tcod-color-rgb 191 151 96))
(define tcod-copper (tcod-color-rgb 197 136 124))
(define tcod-gold (tcod-color-rgb 229 191 0))
(define tcod-silver (tcod-color-rgb 203 203 203))

; miscellaneous
(define tcod-celadon (tcod-color-rgb 172 255 175))
(define tcod-peach (tcod-color-rgb 255 159 127))
