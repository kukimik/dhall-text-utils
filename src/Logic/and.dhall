{-
Given a list of `TextBool` values returns `true` if every
element of the list is `true` and returns `false` otherwise.
-}
let Prelude = ../Prelude.dhall

let TextBool = ./TextBool.dhall

let not = ./not.dhall

let or = ./or.dhall

let true = ./true.dhall

let false = ./false.dhall

let and
    : List TextBool → TextBool
    = λ(vs : List TextBool) →
        not (or (Prelude.List.map TextBool TextBool not vs))

let example0 = assert : true === and [ true, true ]

let example1 = assert : false === and [ true, false, true ]

let example2 = assert : true === and ([] : List TextBool)

in  and
