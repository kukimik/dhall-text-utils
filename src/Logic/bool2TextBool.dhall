{-
TODO
-}
let TextBool = ./TextBool.dhall

let true = ./true.dhall

let false = ./false.dhall

let bool2TextBool
    : Bool → TextBool
    = λ(b : Bool) → if b then true else false

let example0 = true ≡ bool2TextBool True
let example1 = false ≡ bool2TextBool False

in  bool2TextBool
