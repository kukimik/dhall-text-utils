let TextBool = ../Logic/TextBool.dhall

let empty2x = λ(t : Text) → Text/replace "xx" "" ("x" ++ Text/replace t "x" t)

let true = ../Logic/true.dhall

let false = ../Logic/false.dhall

let isEmpty
    : ∀(t : Text) → TextBool
    = λ(t : Text) → { vtb = empty2x t }

let example0 = assert : isEmpty "abc" ≡ false

let example1 = assert : isEmpty "" ≡ true

in  isEmpty
