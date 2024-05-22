{-
Given a list of values of type `a` and a predicate-like
function that maps a value of type `a` to a `TextBool` value,
returns `true` if the predicate function returns `true` for
exactly one element of the list and returns `false` otherwise.
-}
let Prelude = ../Prelude.dhall

let TextBool = ./TextBool.dhall

let xor = ./xor.dhall

let true = ./true.dhall

let false = ./false.dhall

let exactlyOne
    : ∀(a : Type) → ∀(f : a → TextBool) → List a → TextBool
    = λ(a : Type) →
      λ(f : a → TextBool) →
      λ(vs : List a) →
        xor (Prelude.List.map a TextBool f vs)

let example0 =
      let equals = ../Predicates/equals.dhall

      in  true ≡ exactlyOne Text (equals "a") [ "a", "b", "c", "d" ]

let example1 =
      let isEmpty = ../Predicates/isEmpty.dhall

      in  false ≡ exactlyOne Text isEmpty [ "I am not empty.", "", "Hello!" ]

let example2 =
      let isEmpty = ../Predicates/isEmpty.dhall

      in  false ≡ exactlyOne Text isEmpty [ "I am not empty.", "", "" ]

let example3 =
        false
      ≡ exactlyOne TextBool (Prelude.Function.identity TextBool) ([] : List TextBool)

in  exactlyOne
