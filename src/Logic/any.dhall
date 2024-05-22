{-
Given a list of values of type `a` and a predicate-like
function that maps a value of type `a` to a `TextBool` value,
returns `true` if the predicate function returns `true` for
at least one element of the list and returns `false` otherwise.
-}
let Prelude = ../Prelude.dhall

let TextBool = ./TextBool.dhall

let or = ./or.dhall

let true = ./true.dhall

let false = ./false.dhall

let any
    : ∀(a : Type) → ∀(f : a → TextBool) → List a → TextBool
    = λ(a : Type) →
      λ(f : a → TextBool) →
      λ(vs : List a) →
        or (Prelude.List.map a TextBool f vs)

let example0 =
      let contains = ../Predicates/contains.dhall

      in  true ≡ any Text (contains "a") [ "b", "abc", "def", "baba" ]

let example1 =
      let isEmpty = ../Predicates/isEmpty.dhall

      in  false ≡ any Text isEmpty [ "I am not empty.", "Hi!", "Hello!" ]

let example2 =
        false
      ≡ any TextBool (Prelude.Function.identity TextBool) ([] : List TextBool)

in  any
