{-|
Given a list of `TextBool` values returns `true` if exactly one
element of the list is `true` and returns `false` otherwise.
-}
let Prelude = ../Prelude.dhall

let TextBool = ./TextBool.dhall

let getVtb = λ(t : TextBool) → t.`80b81b0c0bbf55ebb04bdadd9c70094a`

let equals = ../Predicates/equals.dhall

let true = ./true.dhall

let false = ./false.dhall

let xor
    : List TextBool → TextBool
    = λ(vs : List TextBool) →
        equals "x" (Prelude.Text.concatMap TextBool getVtb vs)

let example0 = true ≡ xor [ false, true, false ]

let example1 = false ≡ xor [ false, false ]

let example2 = false ≡ xor [ true, true, false ]

let example3 = false ≡ xor ([] : List TextBool)

in  xor
