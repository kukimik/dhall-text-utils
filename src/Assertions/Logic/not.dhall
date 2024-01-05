let TextBool = ./TextBool.dhall
let not : TextBool -> TextBool = \(v : TextBool) -> { vTB = Text/replace "xx" "" "${v.vTB}x") }
in not
