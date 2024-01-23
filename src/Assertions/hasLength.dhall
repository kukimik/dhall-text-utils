let Prelude = ../Prelude.dhall
let TextBool = ../Logic/TextBool.dhall
let isTrue = ../Logic/isTrue.dhall
let isASCII = ./isASCII.dhall
let ASCII = ../CharacterClasses/ASCII.dhall
let equals = ./equals.dhall
let text2xs = List/fold Text ASCII Text (\(c : Text) -> Text/replace c "x")
let hasLength : ∀(n : Natural) -> ∀(t : Text) -> (isTrue (isASCII t)) -> TextBool
  = \(n : Natural) -> \(t : Text) -> \(p : isTrue (isASCII t)) ->
    equals (text2xs t) (Prelude.Text.replicate n "x")
in hasLength
