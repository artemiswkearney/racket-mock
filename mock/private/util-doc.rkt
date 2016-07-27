#lang sweet-exp racket/base

provide
  args-tech
  behavior-tech
  define-args-tech
  define-behavior-tech
  define-mock-tech
  define-opaque-tech
  define-persistent-mock-examples
  define-stub-tech
  mock-examples
  mock-tech
  opaque-tech
  stub-tech
  for-label
    all-from-out mock
                 racket/base
                 racket/contract
                 racket/file
                 racket/function

require
  scribble/example
  scribble/manual
  syntax/parse/define
  for-label mock
            racket/base
            racket/contract
            racket/file
            racket/function

(define mock-doc
  '(lib "mock/main.scrbl"))

(define-simple-macro (define-techs [key:str use-id:id def-id:id] ...)
  (begin
    (begin
      (define (def-id . pre-flow) (apply deftech #:key key pre-flow))
      (define (use-id . pre-flow) (apply tech #:key key #:doc mock-doc pre-flow)))
    ...))

(define-techs
  ["arguments struct" args-tech define-args-tech]
  ["behavior" behavior-tech define-behavior-tech]
  ["mock" mock-tech define-mock-tech]
  ["opaque" opaque-tech define-opaque-tech]
  ["stub" stub-tech define-stub-tech])

(define (make-mock-eval)
  (make-base-eval #:lang 'racket/base
                  '(require mock racket/format racket/function racket/file)))

(define-syntax-rule (mock-examples example ...)
   (examples #:eval (make-mock-eval) example ...))

(define-syntax-rule (define-persistent-mock-examples id)
  (begin
    (define shared-eval (make-mock-eval))
    (define-syntax-rule (id example (... ...))
      (examples #:eval shared-eval example (... ...)))))