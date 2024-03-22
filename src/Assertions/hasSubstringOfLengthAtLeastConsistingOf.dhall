let Prelude = ../Prelude.dhall
let TextBool = ../Logic/TextBool.dhall
let bool2TextBool = ../Logic/bool2TextBool.dhall
let isTrue = ../Logic/isTrue.dhall
let isFalse = ../Logic/isFalse.dhall
let isContainedIn = ./isContainedIn.dhall

let hasSubstringOfLengthAtLeastConsistingOf : ∀(length : Natural) -> ∀(characters : List Text) -> ∀(text : Text) -> TextBool
	  = missing {-} \(length : Natural) -> \(characters : List Text) -> \(text : Text) ->
	  	merge
	  		{
	  		 None = bool2TextBool (Natural/isZero length)
	  		,Some =
	  			\(char : Text) ->
		  			isContainedIn
		  				(List/fold Text characters Text (\(c : Text) -> Text/replace c char) text)
		  				(Prelude.Text.replicate length char)
	  		}
	  		(List/head Text characters)
let example0 =
	assert : isTrue (hasSubstringOfLengthAtLeastConsistingOf 3 ["0","1","2","3","4"] "aaa123bbb")
let example1 =
	assert : isFalse (hasSubstringOfLengthAtLeastConsistingOf 4 ["0","1","2","3","4"] "aaa123bbb")
let example2 =
	assert : isTrue (hasSubstringOfLengthAtLeastConsistingOf 0 ([] : List Text) "")
-}
in hasSubstringOfLengthAtLeastConsistingOf
