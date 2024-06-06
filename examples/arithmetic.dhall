{-|
Natural arithmetic encoded in `Text`.
-}
let Prelude = ../src/Prelude.dhall

let P = ../src/Predicates/package.dhall

let L = ../src/Logic/package.dhall

let T = ../src/Transformations/package.dhall

let TextNatural = Text

let isTextNatural
    : Text → L.TextBool
    = P.consistsOf [ "I" ]

let n
    : Natural → TextNatural
    = λ(i : Natural) → Prelude.Text.replicate i "I"

let add
    : ∀(n1 : TextNatural) →
      ∀(n2 : TextNatural) →
      L.isTrue (L.and [ isTextNatural n1, isTextNatural n2 ]) →
        TextNatural
    = λ(n1 : TextNatural) →
      λ(n2 : TextNatural) →
      λ(_ : L.isTrue (L.and [ isTextNatural n1, isTextNatural n2 ])) →
        n1 ++ n2

let sub
    : ∀(n1 : TextNatural) →
      ∀(n2 : TextNatural) →
      L.isTrue (L.and [ isTextNatural n1, isTextNatural n2 ]) →
        TextNatural
    = λ(n1 : TextNatural) →
      λ(n2 : TextNatural) →
      λ(_ : L.isTrue (L.and [ isTextNatural n1, isTextNatural n2 ])) →
        L.ifThenElse (P.contains n2 n1) (T.stripPrefix n2 n1) ""

let mul
    : ∀(n1 : TextNatural) →
      ∀(n2 : TextNatural) →
      L.isTrue (L.and [ isTextNatural n1, isTextNatural n2 ]) →
        TextNatural
    = λ(n1 : TextNatural) →
      λ(n2 : TextNatural) →
      λ(_ : L.isTrue (L.and [ isTextNatural n1, isTextNatural n2 ])) →
        Text/replace "I" n1 n2

let div
    : ∀(n1 : TextNatural) →
      ∀(n2 : TextNatural) →
      L.isTrue
        (L.and [ isTextNatural n1, isTextNatural n2, L.not (P.equals n2 (n 0)) ]) →
        TextNatural
    = λ(n1 : TextNatural) →
      λ(n2 : TextNatural) →
      λ ( _
        : L.isTrue
            (L.and [ isTextNatural n1, isTextNatural n2, L.not (P.equals n2 (n 0)) ])
        ) →
        T.applyAll
          [ Text/replace "J" "I", Text/replace "I" "", Text/replace n2 "J" ]
          n1

let mod
    : ∀(n1 : TextNatural) →
      ∀(n2 : TextNatural) →
      L.isTrue
        (L.and [ isTextNatural n1, isTextNatural n2, L.not (P.equals n2 (n 0)) ]) →
        TextNatural
    = λ(n1 : TextNatural) →
      λ(n2 : TextNatural) →
      λ ( _
        : L.isTrue
            (L.and [ isTextNatural n1, isTextNatural n2, L.not (P.equals n2 (n 0)) ])
        ) →
        Text/replace n2 "" n1

let test1 = assert : add (n 2) (n 2) L.QED ≡ n 4

let test2 = assert : sub (n 5) (n 3) L.QED ≡ n 2

let test3 = assert : sub (n 5) (n 7) L.QED ≡ n 0

let test4 = assert : mul (n 0) (n 4) L.QED ≡ n 0

let test4 = assert : mul (n 3) (n 5) L.QED ≡ n 15

let test4 = assert : div (n 14) (n 3) L.QED ≡ n 4

let test5 = assert : div (n 10) (n 11) L.QED ≡ n 0

let test6 = assert : mod (n 10) (n 3) L.QED ≡ n 1

in  { TextNatural, isTextNatural, n, add, sub, mul, div, mod }
