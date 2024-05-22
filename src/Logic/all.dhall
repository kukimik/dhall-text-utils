{-
Given a list of values of type `a` and a predicate-like
function that maps a value of type `a` to a `TextBool` value,
returns `true` if the predicate function returns `true` for
all elements of the list and returns `false` otherwise.
-}
let Prelude = ../Prelude.dhall

let TextBool = ./TextBool.dhall

let and = ./and.dhall

let true = ./true.dhall

let false = ./false.dhall

let all
    : ∀(a : Type) → ∀(predicate : a → TextBool) → List a → TextBool
    = λ(a : Type) →
      λ(predicate : a → TextBool) →
      λ(vs : List a) →
        and (Prelude.List.map a TextBool predicate vs)

let example0 =
      let contains = ../Predicates/contains.dhall

      in    true
          ≡ all
              Text
              (contains "world")
              [ "what a wonderful world"
              , "hello world!"
              , "goodbye cruel world"
              ]

let example1 =
      let isEmpty = ../Predicates/isEmpty.dhall

      in  false ≡ all Text isEmpty [ "", "I am not empty.", "", "" ]

let example2 =
        true
      ≡ all TextBool (Prelude.Function.identity TextBool) ([] : List TextBool)

in  all
