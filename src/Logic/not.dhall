{-
Negation. Given `true` returns `false`. Given `false` returns `true`.
-}
let TextBool = ./TextBool.dhall

let true = ./true.dhall

let false = ./false.dhall

let not
    : TextBool → TextBool
    = λ(v : TextBool) → { vtb = Text/replace "xx" "" "${v.vtb}x" }

let example0 = false ≡ not true

let example1 = true ≡ not false

in  not
