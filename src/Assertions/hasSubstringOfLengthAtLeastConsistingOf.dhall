let Prelude = ../Prelude.dhall
let TextBool = ../Logic/TextBool.dhall
let isTrue = ../Logic/isTrue.dhall
let isFalse = ../Logic/isFalse.dhall
let ifThenElse = ../Logic/ifThenElse.dhall
let isContainedIn = ./isContainedIn.dhall
let isElementOf = ./isElementOf.dhall
let or = ../Logic/or.dhall
let ASCIIdigit = ../CharacterClasses/ASCIIdigit.dhall

let hasSubstringOfLengthAtLeastConsistingOf : ∀(length : Natural) -> ∀(characters : List Text) -> ∀(t : Text) -> TextBool
	  = \(n : Natural) -> \(characters : List Text) -> \(t : Text) ->
	  	let xInCharacterClass = isElementOf characters "x"
	  	let yInCharacterClass = isElementOf characters "y"
	  	let replacementChar = ifThenElse xInCharacterClass "x" (ifThenElse yInCharacterClass "y" "x")
	  	let preparedText = ifThenElse (or [xInCharacterClass, yInCharacterClass]) t (Text/replace "x" "y" t)
	  	let textWithCharactersReplacedByReplacementChar = List/fold Text characters Text (\(c : Text) -> Text/replace c replacementChar) preparedText
	  	in isContainedIn textWithCharactersReplacedByReplacementChar (Prelude.Text.replicate n replacementChar)
let example0 =
	assert : isTrue (hasSubstringOfLengthAtLeastConsistingOf 3 ASCIIdigit "aaa123bbb")
let example1 =
	assert : isFalse (hasSubstringOfLengthAtLeastConsistingOf 4 ASCIIdigit "aaa123bbb")
let example2 =
	assert : isTrue (hasSubstringOfLengthAtLeastConsistingOf 0 ([] : List Text) "")

-- TODO: some tests involving x and y?

in hasSubstringOfLengthAtLeastConsistingOf
