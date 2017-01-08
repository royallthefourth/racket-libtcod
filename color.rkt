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
(define-tcod tcod-color-rgb (_fun _uint8 _uint8 _uint8 -> _tcod-color-t) #:c-id TCOD_color_RGB)
(define-tcod tcod-color-hsv (_fun _float _float _float -> _tcod-color-t) #:c-id TCOD_color_HSV)

; basic operations
(define-tcod tcod-color-equals (_fun _tcod-color-t _tcod-color-t -> _bool) #:c-id TCOD_color_equals)
(define-tcod tcod-color-add (_fun _tcod-color-t _tcod-color-t -> _tcod-color-t) #:c-id TCOD_color_add)
(define-tcod tcod-color-subtract (_fun _tcod-color-t _tcod-color-t -> _tcod-color-t) #:c-id TCOD_color_subtract)
(define-tcod tcod-color-multiply (_fun _tcod-color-t _tcod-color-t -> _tcod-color-t) #:c-id TCOD_color_multiply)
(define-tcod tcod-color-multiply-scalar (_fun _tcod-color-t _float -> _tcod-color-t) #:c-id TCOD_color_multiply_scalar)
(define-tcod tcod-color-lerp (_fun _tcod-color-t _tcod-color-t _float -> _tcod-color-t) #:c-id TCOD_color_lerp)

; HSV transformations
(define-tcod tcod-color-set-hsv (_fun _tcod-color-t-pointer _float _float _float -> _void) #:c-id TCOD_color_set_HSV)
(define-tcod tcod-color-get-hsv (_fun _tcod-color-t _float* _float* _float* -> _void) #:c-id TCOD_color_get_HSV)
(define-tcod tcod-color-get-hue (_fun _tcod-color-t -> _float) #:c-id TCOD_color_get_hue)
(define-tcod tcod-color-set-hue (_fun _tcod-color-t-pointer _float -> _void) #:c-id TCOD_color_set_hue)
(define-tcod tcod-color-get-saturation (_fun _tcod-color-t -> _float) #:c-id TCOD_color_get_saturation)
(define-tcod tcod-color-set-saturation (_fun _tcod-color-t-pointer _float -> _void) #:c-id TCOD_color_set_saturation)
(define-tcod tcod-color-get-value (_fun _tcod-color-t -> _float) #:c-id TCOD_color_get_value)
(define-tcod tcod-color-set-value (_fun _tcod-color-t-pointer _float -> _void) #:c-id TCOD_color_set_value)
(define-tcod tcod-color-shift-hue (_fun _tcod-color-t-pointer _float -> _void) #:c-id TCOD_color_shift_hue)
(define-tcod tcod-color-scale-hsv (_fun _tcod-color-t-pointer _float _float -> _void) #:c-id TCOD_color_scale_HSV)

; color map
(define-tcod tcod-color-gen-map (_fun _tcod-color-t-pointer _int _tcod-color-t-pointer _int* -> _void) #:c-id TCOD_color_gen_map)

; color names
(define tcod_black (tcod-color-rgb 0 0 0))
(define tcod_darkest_grey (tcod-color-rgb 31 31 31))
(define tcod_darker_grey (tcod-color-rgb 63 63 63))
(define tcod_dark_grey (tcod-color-rgb 95 95 95))
(define tcod_grey (tcod-color-rgb 127 127 127))
(define tcod_light_grey (tcod-color-rgb 159 159 159))
(define tcod_lighter_grey (tcod-color-rgb 191 191 191))
(define tcod_lightest_grey (tcod-color-rgb 223 223 223))
(define tcod_white (tcod-color-rgb 255 255 255))

(define tcod_darkest_sepia (tcod-color-rgb 31 24 15))
(define tcod_darker_sepia (tcod-color-rgb 63 50 31))
(define tcod_dark_sepia (tcod-color-rgb 94 75 47))
(define tcod_sepia (tcod-color-rgb 127 101 63))
(define tcod_light_sepia (tcod-color-rgb 158 134 100))
(define tcod_lighter_sepia (tcod-color-rgb 191 171 143))
(define tcod_lightest_sepia (tcod-color-rgb 222 211 195))

; desaturated
(define tcod_desaturated_red (tcod-color-rgb 127 63 63))
(define tcod_desaturated_flame (tcod-color-rgb 127 79 63))
(define tcod_desaturated_orange (tcod-color-rgb 127 95 63))
(define tcod_desaturated_amber (tcod-color-rgb 127 111 63))
(define tcod_desaturated_yellow (tcod-color-rgb 127 127 63))
(define tcod_desaturated_lime (tcod-color-rgb 111 127 63))
(define tcod_desaturated_chartreuse (tcod-color-rgb 95 127 63))
(define tcod_desaturated_green (tcod-color-rgb 63 127 63))
(define tcod_desaturated_sea (tcod-color-rgb 63 127 95))
(define tcod_desaturated_turquoise (tcod-color-rgb 63 127 111))
(define tcod_desaturated_cyan (tcod-color-rgb 63 127 127))
(define tcod_desaturated_sky (tcod-color-rgb 63 111 127))
(define tcod_desaturated_azure (tcod-color-rgb 63 95 127))
(define tcod_desaturated_blue (tcod-color-rgb 63 63 127))
(define tcod_desaturated_han (tcod-color-rgb 79 63 127))
(define tcod_desaturated_violet (tcod-color-rgb 95 63 127))
(define tcod_desaturated_purple (tcod-color-rgb 111 63 127))
(define tcod_desaturated_fuchsia (tcod-color-rgb 127 63 127))
(define tcod_desaturated_magenta (tcod-color-rgb 127 63 111))
(define tcod_desaturated_pink (tcod-color-rgb 127 63 95))
(define tcod_desaturated_crimson (tcod-color-rgb 127 63 79))

; lightest
(define tcod_lightest_red (tcod-color-rgb 255 191 191))
(define tcod_lightest_flame (tcod-color-rgb 255 207 191))
(define tcod_lightest_orange (tcod-color-rgb 255 223 191))
(define tcod_lightest_amber (tcod-color-rgb 255 239 191))
(define tcod_lightest_yellow (tcod-color-rgb 255 255 191))
(define tcod_lightest_lime (tcod-color-rgb 239 255 191))
(define tcod_lightest_chartreuse (tcod-color-rgb 223 255 191))
(define tcod_lightest_green (tcod-color-rgb 191 255 191))
(define tcod_lightest_sea (tcod-color-rgb 191 255 223))
(define tcod_lightest_turquoise (tcod-color-rgb 191 255 239))
(define tcod_lightest_cyan (tcod-color-rgb 191 255 255))
(define tcod_lightest_sky (tcod-color-rgb 191 239 255))
(define tcod_lightest_azure (tcod-color-rgb 191 223 255))
(define tcod_lightest_blue (tcod-color-rgb 191 191 255))
(define tcod_lightest_han (tcod-color-rgb 207 191 255))
(define tcod_lightest_violet (tcod-color-rgb 223 191 255))
(define tcod_lightest_purple (tcod-color-rgb 239 191 255))
(define tcod_lightest_fuchsia (tcod-color-rgb 255 191 255))
(define tcod_lightest_magenta (tcod-color-rgb 255 191 239))
(define tcod_lightest_pink (tcod-color-rgb 255 191 223))
(define tcod_lightest_crimson (tcod-color-rgb 255 191 207))

; lighter
(define tcod_lighter_red (tcod-color-rgb 255 127 127))
(define tcod_lighter_flame (tcod-color-rgb 255 159 127))
(define tcod_lighter_orange (tcod-color-rgb 255 191 127))
(define tcod_lighter_amber (tcod-color-rgb 255 223 127))
(define tcod_lighter_yellow (tcod-color-rgb 255 255 127))
(define tcod_lighter_lime (tcod-color-rgb 223 255 127))
(define tcod_lighter_chartreuse (tcod-color-rgb 191 255 127))
(define tcod_lighter_green (tcod-color-rgb 127 255 127))
(define tcod_lighter_sea (tcod-color-rgb 127 255 191))
(define tcod_lighter_turquoise (tcod-color-rgb 127 255 223))
(define tcod_lighter_cyan (tcod-color-rgb 127 255 255))
(define tcod_lighter_sky (tcod-color-rgb 127 223 255))
(define tcod_lighter_azure (tcod-color-rgb 127 191 255))
(define tcod_lighter_blue (tcod-color-rgb 127 127 255))
(define tcod_lighter_han (tcod-color-rgb 159 127 255))
(define tcod_lighter_violet (tcod-color-rgb 191 127 255))
(define tcod_lighter_purple (tcod-color-rgb 223 127 255))
(define tcod_lighter_fuchsia (tcod-color-rgb 255 127 255))
(define tcod_lighter_magenta (tcod-color-rgb 255 127 223))
(define tcod_lighter_pink (tcod-color-rgb 255 127 191))
(define tcod_lighter_crimson (tcod-color-rgb 255 127 159))

; light
(define tcod_light_red (tcod-color-rgb 255 63 63))
(define tcod_light_flame (tcod-color-rgb 255 111 63))
(define tcod_light_orange (tcod-color-rgb 255 159 63))
(define tcod_light_amber (tcod-color-rgb 255 207 63))
(define tcod_light_yellow (tcod-color-rgb 255 255 63))
(define tcod_light_lime (tcod-color-rgb 207 255 63))
(define tcod_light_chartreuse (tcod-color-rgb 159 255 63))
(define tcod_light_green (tcod-color-rgb 63 255 63))
(define tcod_light_sea (tcod-color-rgb 63 255 159))
(define tcod_light_turquoise (tcod-color-rgb 63 255 207))
(define tcod_light_cyan (tcod-color-rgb 63 255 255))
(define tcod_light_sky (tcod-color-rgb 63 207 255))
(define tcod_light_azure (tcod-color-rgb 63 159 255))
(define tcod_light_blue (tcod-color-rgb 63 63 255))
(define tcod_light_han (tcod-color-rgb 111 63 255))
(define tcod_light_violet (tcod-color-rgb 159 63 255))
(define tcod_light_purple (tcod-color-rgb 207 63 255))
(define tcod_light_fuchsia (tcod-color-rgb 255 63 255))
(define tcod_light_magenta (tcod-color-rgb 255 63 207))
(define tcod_light_pink (tcod-color-rgb 255 63 159))
(define tcod_light_crimson (tcod-color-rgb 255 63 111))

; normal
(define tcod_red (tcod-color-rgb 255 0 0))
(define tcod_flame (tcod-color-rgb 255 63 0))
(define tcod_orange (tcod-color-rgb 255 127 0))
(define tcod_amber (tcod-color-rgb 255 191 0))
(define tcod_yellow (tcod-color-rgb 255 255 0))
(define tcod_lime (tcod-color-rgb 191 255 0))
(define tcod_chartreuse (tcod-color-rgb 127 255 0))
(define tcod_green (tcod-color-rgb 0 255 0))
(define tcod_sea (tcod-color-rgb 0 255 127))
(define tcod_turquoise (tcod-color-rgb 0 255 191))
(define tcod_cyan (tcod-color-rgb 0 255 255))
(define tcod_sky (tcod-color-rgb 0 191 255))
(define tcod_azure (tcod-color-rgb 0 127 255))
(define tcod_blue (tcod-color-rgb 0 0 255))
(define tcod_han (tcod-color-rgb 63 0 255))
(define tcod_violet (tcod-color-rgb 127 0 255))
(define tcod_purple (tcod-color-rgb 191 0 255))
(define tcod_fuchsia (tcod-color-rgb 255 0 255))
(define tcod_magenta (tcod-color-rgb 255 0 191))
(define tcod_pink (tcod-color-rgb 255 0 127))
(define tcod_crimson (tcod-color-rgb 255 0 63))

; dark
(define tcod_dark_red (tcod-color-rgb 191 0 0))
(define tcod_dark_flame (tcod-color-rgb 191 47 0))
(define tcod_dark_orange (tcod-color-rgb 191 95 0))
(define tcod_dark_amber (tcod-color-rgb 191 143 0))
(define tcod_dark_yellow (tcod-color-rgb 191 191 0))
(define tcod_dark_lime (tcod-color-rgb 143 191 0))
(define tcod_dark_chartreuse (tcod-color-rgb 95 191 0))
(define tcod_dark_green (tcod-color-rgb 0 191 0))
(define tcod_dark_sea (tcod-color-rgb 0 191 95))
(define tcod_dark_turquoise (tcod-color-rgb 0 191 143))
(define tcod_dark_cyan (tcod-color-rgb 0 191 191))
(define tcod_dark_sky (tcod-color-rgb 0 143 191))
(define tcod_dark_azure (tcod-color-rgb 0 95 191))
(define tcod_dark_blue (tcod-color-rgb 0 0 191))
(define tcod_dark_han (tcod-color-rgb 47 0 191))
(define tcod_dark_violet (tcod-color-rgb 95 0 191))
(define tcod_dark_purple (tcod-color-rgb 143 0 191))
(define tcod_dark_fuchsia (tcod-color-rgb 191 0 191))
(define tcod_dark_magenta (tcod-color-rgb 191 0 143))
(define tcod_dark_pink (tcod-color-rgb 191 0 95))
(define tcod_dark_crimson (tcod-color-rgb 191 0 47))

; darker
(define tcod_darker_red (tcod-color-rgb 127 0 0))
(define tcod_darker_flame (tcod-color-rgb 127 31 0))
(define tcod_darker_orange (tcod-color-rgb 127 63 0))
(define tcod_darker_amber (tcod-color-rgb 127 95 0))
(define tcod_darker_yellow (tcod-color-rgb 127 127 0))
(define tcod_darker_lime (tcod-color-rgb 95 127 0))
(define tcod_darker_chartreuse (tcod-color-rgb 63 127 0))
(define tcod_darker_green (tcod-color-rgb 0 127 0))
(define tcod_darker_sea (tcod-color-rgb 0 127 63))
(define tcod_darker_turquoise (tcod-color-rgb 0 127 95))
(define tcod_darker_cyan (tcod-color-rgb 0 127 127))
(define tcod_darker_sky (tcod-color-rgb 0 95 127))
(define tcod_darker_azure (tcod-color-rgb 0 63 127))
(define tcod_darker_blue (tcod-color-rgb 0 0 127))
(define tcod_darker_han (tcod-color-rgb 31 0 127))
(define tcod_darker_violet (tcod-color-rgb 63 0 127))
(define tcod_darker_purple (tcod-color-rgb 95 0 127))
(define tcod_darker_fuchsia (tcod-color-rgb 127 0 127))
(define tcod_darker_magenta (tcod-color-rgb 127 0 95))
(define tcod_darker_pink (tcod-color-rgb 127 0 63))
(define tcod_darker_crimson (tcod-color-rgb 127 0 31))

; darkest
(define tcod_darkest_red (tcod-color-rgb 63 0 0))
(define tcod_darkest_flame (tcod-color-rgb 63 15 0))
(define tcod_darkest_orange (tcod-color-rgb 63 31 0))
(define tcod_darkest_amber (tcod-color-rgb 63 47 0))
(define tcod_darkest_yellow (tcod-color-rgb 63 63 0))
(define tcod_darkest_lime (tcod-color-rgb 47 63 0))
(define tcod_darkest_chartreuse (tcod-color-rgb 31 63 0))
(define tcod_darkest_green (tcod-color-rgb 0 63 0))
(define tcod_darkest_sea (tcod-color-rgb 0 63 31))
(define tcod_darkest_turquoise (tcod-color-rgb 0 63 47))
(define tcod_darkest_cyan (tcod-color-rgb 0 63 63))
(define tcod_darkest_sky (tcod-color-rgb 0 47 63))
(define tcod_darkest_azure (tcod-color-rgb 0 31 63))
(define tcod_darkest_blue (tcod-color-rgb 0 0 63))
(define tcod_darkest_han (tcod-color-rgb 15 0 63))
(define tcod_darkest_violet (tcod-color-rgb 31 0 63))
(define tcod_darkest_purple (tcod-color-rgb 47 0 63))
(define tcod_darkest_fuchsia (tcod-color-rgb 63 0 63))
(define tcod_darkest_magenta (tcod-color-rgb 63 0 47))
(define tcod_darkest_pink (tcod-color-rgb 63 0 31))
(define tcod_darkest_crimson (tcod-color-rgb 63 0 15))

; metallic
(define tcod_brass (tcod-color-rgb 191 151 96))
(define tcod_copper (tcod-color-rgb 197 136 124))
(define tcod_gold (tcod-color-rgb 229 191 0))
(define tcod_silver (tcod-color-rgb 203 203 203))

; miscellaneous
(define tcod_celadon (tcod-color-rgb 172 255 175))
(define tcod_peach (tcod-color-rgb 255 159 127))
