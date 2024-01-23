let Prelude = ../Prelude.dhall
let TextBool = ../Logic/TextBool.dhall
let isTrue = ../Logic/isTrue.dhall
let isASCII = ./isASCII.dhall
let ASCII = ../CharacterClasses/ASCII.dhall
let contains = ./contains.dhall
let text2xs = List/fold Text ASCII Text (\(c : Text) -> Text/replace c "x")
let hasLengthAtMost : ∀(n : Natural) -> ∀(t : Text) -> (isTrue (isASCII t)) -> TextBool
	  = \(n : Natural) -> \(t : Text) -> \(p : isTrue (isASCII t)) -> contains (text2xs t) (Prelude.Text.replicate n "x")
in hasLengthAtMost
