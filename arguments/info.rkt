#lang info
(define collection "arguments")
(define scribblings '(("main.scrbl" () (library) "arguments")))
(define version "1.0")
(define deps
  '("base"))
(define build-deps
  '("racket-doc"
    "rackunit-lib"
    "scribble-lib"))