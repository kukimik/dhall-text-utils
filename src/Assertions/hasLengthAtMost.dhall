let TextBool = ../Logic/TextBool.dhall
let isTrue = ../Logic/isTrue.dhall
let isASCII = ./isASCII.dhall
let contains = ./contains.dhall
let text2xs = List/fold Text ASCII Text (\(c : Text) -> Text/replace c "x")
let hasLengthAtMost (n : Natural) -> (t : Text) -> (isTrue (isASCII t)) -> TextBool
	  = contains (text2xs t) (Prelude.Text.replicate n "x")
in hasLengthAtMost
