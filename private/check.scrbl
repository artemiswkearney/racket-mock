#lang scribble/manual
@(require "util-doc.rkt")

@title{Mock RackUnit Checks}
@defmodule[mock/rackunit #:packages ("jack-mock")]

@defproc[(check-mock-called-with? [m mock?] [args arguments])
         void?]{
 A @racketmodname[rackunit] check that passes if @racket[m] has
 been called with @racket[args].
 @mock-examples[
 (define void-mock (mock #:behavior void))
 (check-mock-called-with? void-mock (arguments 'foo))
 (void-mock 'foo)
 (check-mock-called-with? void-mock (arguments 'foo))]}

@defproc[(check-mock-num-calls [m mock?] [n exact-positive-integer?])
         void?]{
 A @racketmodname[rackunit] check that passes if @racket[m] has
 been called exactly @racket[n] times.
 @mock-examples[
 (define void-mock (mock #:behavior void))
 (check-mock-num-calls void-mock 1)
 (void-mock 'foo)
 (check-mock-num-calls void-mock 1)]}
