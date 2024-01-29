let Prelude = ../Prelude.dhall

let TextBool = ./TextBool.dhall

let getVtb = λ(t : TextBool) → t.vtb

let equals = ../Assertions/equals.dhall

let xor
    : List TextBool → TextBool
    = λ(vs : List TextBool) →
        equals "x" (Prelude.Text.concatMap TextBool getVtb vs)

in xor
