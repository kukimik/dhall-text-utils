let Prelude = ../Prelude.dhall

let TextBool = ./TextBool.dhall

let xor = ./xor.dhall

-- How about: exactlyNOf, noMoreThanNOf, noLessThanNOf? (and xor counterparts)

let exactlyOne
    : ∀(a : Type) → ∀(f : a → TextBool) → List a → TextBool
    = λ(a : Type) →
      λ(f : a → TextBool) →
      λ(vs : List a) →
        xor (Prelude.List.map a TextBool f vs)

in exactlyOne
