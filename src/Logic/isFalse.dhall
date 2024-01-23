let TextBool = ./TextBool.dhall
let true = ./true.dhall
let not = ./not.dhall
let isFalse : ∀(v : TextBool) -> Type = \(v : TextBool) -> true === not v
in isFalse
