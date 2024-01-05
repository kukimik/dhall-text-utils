let TextBool = ./TextBool.dhall
let vtb : TextBool -> Text = \( v : TextBool) -> v.vtb
in vtb
