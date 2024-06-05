{-
Negation. Given `true` returns `false`. Given `false` returns `true`.
-}
let TextBool = ./TextBool.dhall

let true = ./true.dhall

let false = ./false.dhall

let not
    : TextBool → TextBool
    = λ(v : TextBool) → { `80b81b0c0bbf55ebb04bdadd9c70094a` = Text/replace "xx" "" "${v.`80b81b0c0bbf55ebb04bdadd9c70094a`}x" }

let example0 = false ≡ not true

let example1 = true ≡ not false

in  not
