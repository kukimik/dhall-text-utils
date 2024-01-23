let Prelude = ../Prelude.dhall
let TextBool = ../Logic/TextBool.dhall
let isTrue = ../Logic/isTrue.dhall
let isASCII = ./isASCII.dhall
let ASCII = ../CharacterClasses/ASCII.dhall
let isContainedIn = ./isContainedIn.dhall
let text2xs = List/fold Text ASCII Text (\(c : Text) -> Text/replace c "x")
let hasLengthAtLeast : ∀(n : Natural) -> ∀(t : Text) -> (isTrue (isASCII t)) -> TextBool
	  = \(n : Natural) -> \(t : Text) -> \(p : isTrue (isASCII t)) ->
	  isContainedIn (text2xs t) (Prelude.Text.replicate n "x")
in hasLengthAtLeast
