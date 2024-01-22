let Prelude = ../Prelude.dhall

let TextBool = ./TextBool.dhall

let or = ./or.dhall

let all
    : (a : Type) → (f : a → TextBool) → List a → TextBool
    = λ(a : Type) →
      λ(f : a → TextBool) →
      λ(vs : List a) →
        and (Prelude.List.map a TextBool f vs)

in  all
