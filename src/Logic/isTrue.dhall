let TextBool = ./TextBool.dhall
let true = ./true.dhall
let isTrue : ∀(v : TextBool) -> Type = \(v : TextBool) -> true === v
in isTrue
