let TextBool = ./TextBool.dhall
let not : TextBool -> TextBool = \(v : TextBool) -> { vtb = Text/replace "xx" "" "${v.vtb}x" }
in not
