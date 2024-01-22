let TextBool = ./TextBool.dhall

let not
    : TextBool → TextBool
    = λ(v : TextBool) → { vtb = Text/replace "xx" "" "${v.vtb}x" }

in  not
