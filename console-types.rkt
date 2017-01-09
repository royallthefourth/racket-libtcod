#lang racket/base

(require "common.rkt" ffi/unsafe)
(provide (all-defined-out))

(define _tcod-keycode-t
  (_enum '(tcodk-none
           tcodk-escape
           tcodk-backspace
           tcodk-tab
           tcodk-enter
           tcodk-shift
           tcodk-control
           tcodk-alt
           tcodk-pause
           tcodk-capslock
           tcodk-pageup
           tcodk-pagedown
           tcodk-end
           tcodk-home
           tcodk-up
           tcodk-left
           tcodk-right
           tcodk-down
           tcodk-printscreen
           tcodk-insert
           tcodk-delete
           tcodk-lwin
           tcodk-rwin
           tcodk-apps
           tcodk-0
           tcodk-1
           tcodk-2
           tcodk-3
           tcodk-4
           tcodk-5
           tcodk-6
           tcodk-7
           tcodk-8
           tcodk-9
           tcodk-kp0
           tcodk-kp1
           tcodk-kp2
           tcodk-kp3
           tcodk-kp4
           tcodk-kp5
           tcodk-kp6
           tcodk-kp7
           tcodk-kp8
           tcodk-kp9
           tcodk-kpadd
           tcodk-kpsub
           tcodk-kpdiv
           tcodk-kpmul
           tcodk-kpdec
           tcodk-kpenter
           tcodk-f1
           tcodk-f2
           tcodk-f3
           tcodk-f4
           tcodk-f5
           tcodk-f6
           tcodk-f7
           tcodk-f8
           tcodk-f9
           tcodk-f10
           tcodk-f11
           tcodk-f12
           tcodk-numlock
           tcodk-scrolllock
           tcodk-space
           tcodk-char
           tcodk-text)))

(define _tcod-chars-t
  (_enum '(
           ; single walls
           tcod-char-hline = 196
                           tcod-char-vline = 179
                           tcod-char-ne = 191
                           tcod-char-nw = 218
                           tcod-char-se = 217
                           tcod-char-sw = 192
                           tcod-char-teew = 180
                           tcod-char-teee = 195
                           tcod-char-teen = 193
                           tcod-char-tees = 194
                           tcod-char-cross = 197
                           ; double walls
                           tcod-char-dhline = 205
                           tcod-char-dvline = 186
                           tcod-char-dne = 187
                           tcod-char-dnw = 201
                           tcod-char-dse = 188
                           tcod-char-dsw = 200
                           tcod-char-dteew = 185
                           tcod-char-dteee = 204
                           tcod-char-dteen = 202
                           tcod-char-dtees = 203
                           tcod-char-dcross = 206
                           ; blocks
                           tcod-char-block1=176
                           tcod-char-block2=177
                           tcod-char-block3=178
                           ; arrows
                           tcod-char-arrow-n = 24
                           tcod-char-arrow-s = 25
                           tcod-char-arrow-e = 26
                           tcod-char-arrow-w = 27
                           ; arrows without tail
                           tcod-char-arrow2-n = 30
                           tcod-char-arrow2-s = 31
                           tcod-char-arrow2-e = 16
                           tcod-char-arrow2-w = 17
                           ; double arrows
                           tcod-char-darrow-h = 29
                           tcod-char-darrow-v = 18
                           ; gui stuff
                           tcod-char-checkbox-unset = 224
                           tcod-char-checkbox-set = 225
                           tcod-char-radio-unset = 9
                           tcod-char-radio-set = 10
                           ; sub-pixel resolution kit
                           tcod-char-subp-nw = 226
                           tcod-char-subp-ne = 227
                           tcod-char-subp-n = 228
                           tcod-char-subp-se = 229
                           tcod-char-subp-diag = 230
                           tcod-char-subp-e = 231
                           tcod-char-subp-sw = 232
                           ; miscellaneous
                           tcod-char-smilie = 1
                           tcod-char-smilie-inv = 2
                           tcod-char-heart = 3
                           tcod-char-diamond = 4
                           tcod-char-club = 5
                           tcod-char-spade = 6
                           tcod-char-bullet = 7
                           tcod-char-bullet-inv = 8
                           tcod-char-male = 11
                           tcod-char-female = 12
                           tcod-char-note = 13
                           tcod-char-note-double = 14
                           tcod-char-light = 15
                           tcod-char-exclam-double = 19
                           tcod-char-pilcrow = 20
                           tcod-char-section = 21
                           tcod-char-pound = 156
                           tcod-char-multiplication = 158
                           tcod-char-function = 159
                           tcod-char-reserved = 169
                           tcod-char-half = 171
                           tcod-char-one-quarter = 172
                           tcod-char-copyright = 184
                           tcod-char-cent = 189
                           tcod-char-yen = 190
                           tcod-char-currency = 207
                           tcod-char-three-quarters = 243
                           tcod-char-division = 246
                           tcod-char-grade = 248
                           tcod-char-umlaut = 249
                           tcod-char-pow1 = 251
                           tcod-char-pow3 = 252
                           tcod-char-pow2 = 253
                           tcod-char-bullet-square = 254)))

(define _tcod-colctrl-t
  (_enum
   '(tcod-colctrl-1 = 1
                    tcod-colctrl-2
                    tcod-colctrl-3
                    tcod-colctrl-4
                    tcod-colctrl-5
                    tcod-colctrl-number = 5
                    tcod-colctrl-fore-rgb
                    tcod-colctrl-back-rgb
                    tcod-colctrl-stop)))

(define _tcod-bkgnd-flag-t
  (_enum
   '(tcod-bkgnd-none
     tcod-bkgnd-set
     tcod-bkgnd-multiply
     tcod-bkgnd-lighten
     tcod-bkgnd-darken
     tcod-bkgnd-screen
     tcod-bkgnd-color-dodge
     tcod-bkgnd-color-burn
     tcod-bkgnd-add
     tcod-bkgnd-adda
     tcod-bkgnd-burn
     tcod-bkgnd-overlay
     tcod-bkgnd-alph
     tcod-bkgnd-default)))

(define _tcod-key-status-t
  (_enum
   '(tcod-key-pressed = 1
                      tcod-key-released = 2)))

; custom font flags
(define _tcod-font-flags-t
  (_enum
   '(tcod-font-layout-ascii-incol = 1
                                  tcod-font-layout-ascii-inrow = 2
                                  tcod-font-type-greyscale = 4
                                  tcod-font-type-grayscale = 4
                                  tcod-font-layout-tcod = 8)))

(define _tcod-renderer-t
  (_enum '(tcod-renderer-glsl
           tcod-renderer-opengl
           tcod-renderer-sdl
           tcod-nb-renderers)))

(define _tcod-alignment-t
  (_enum '(tcod-left
           tcod-right
           tcod-center)))

(define-cstruct _tcod-key-t
  ([vk _tcod-keycode-t]
   [c _uint8]
   [b _string]
   [pressed _bool]
   [lalt _bool]
   [lctrl _bool]
   [lmeta _bool]
   [ralt _bool]
   [rctrl _bool]
   [rmeta _bool]
   [shift _bool]))

(define _tcod-console-t* (_cpointer 'TCOD_console_t))
