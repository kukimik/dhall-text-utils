{- The unique `TextBool` value corresponding to truth. -}
let TextBool = ./TextBool.dhall

let true
    : TextBool
    = { vtb = "x" }

in  true
