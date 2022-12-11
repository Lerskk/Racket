#lang racket

(require 2htdp/image)
(require 2htdp/universe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; estado del sistema:
(define-struct state [color angle rotate])
; estado es (make-estado ......).
; Interpretación: ....

; constantes
(define HEIGHT 300)
(define WIDTH 300)
(define BG-COLOR "green")

(define SQUARE-SIDE 150)
(define SQUARE-COLOR "red")
(define ANGLE 0)
(define ROTATE "on")

(define GRADES-PER-TICK 5)

(define INIT (make-state SQUARE-COLOR ANGLE ROTATE)) ; estado inicial


; draw : state -> Image

(define (draw state) 
  (place-image 
    (rotate (state-angle state) (square SQUARE-SIDE "solid" (state-color state))) 
    (/ WIDTH 2) (/ HEIGHT 2) 
    (rectangle WIDTH HEIGHT "solid" BG-COLOR)))

; key-handler : estado key -> estado
;
(define (key-handler state key)
  (cond
    [(key=? key " ") (make-state (state-color state) (state-angle state) (if (string=? (state-rotate state) "on") "off" "on"))]
    [(key=? key "y") (make-state "yellow" (state-angle state) (state-rotate state))]
    [(key=? key "b") (make-state "blue" (state-angle state) (state-rotate state))]
    [(key=? key "r") (make-state "red" (state-angle state) (state-rotate state))]
    [else state]))
                       
; actualizar-angulo : estado -> estado
; responde al tick del reloj
(define (clock state)
  (if (string=? (state-rotate state) "off" )
    (cond
      [(> (+ (state-angle state) GRADES-PER-TICK) 360) (make-state (state-color state) (- (+ (state-angle state) GRADES-PER-TICK) 360) (state-rotate state))]
      [else (make-state (state-color state) (+ (state-angle state) 5) (state-rotate state))])
    state))


(big-bang INIT
  [to-draw draw]
  [on-tick clock]
  [on-key  key-handler])

