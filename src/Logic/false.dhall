{-| The unique `TextBool` value corresponding to false. -}
let TextBool = ./TextBool.dhall

let false
    : TextBool
    = { vtb = "" }

in  false
