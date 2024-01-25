{-
The function `goodUsername` checks whether the provided string follows the
recommendations for a Linux username specified in the man page of `useradd`:

> It is usually recommended to only use usernames that begin with a lower case letter or an underscore, followed by lower case letters, digits, underscores, or
> dashes. They can end with a dollar sign. In regular expression terms: [a-z_][a-z0-9_-]*[$]?
>
> [...]
>
> Usernames may only be up to 32 characters long.

* note: second argument (could do without it)
-}
let L = ../src/Logic/package.dhall
let A = ../src/Assertions/package.dhall
let C = ../src/CharacterClasses/package.dhall
let T = ../src/Transformations/package.dhall
let goodUsername = \(username : Text) -> \(p : (L.isTrue (A.isASCII username))) ->
	let usernameWithoutTrailingDollar = T.stripSuffix "$" username
	let allowedFirstChars = ["_"] # C.ASCIIlower
	let allowedInteriorChars = allowedFirstChars # C.ASCIIdigit
	let conditions =
		[
		 L.any Text (A.isPrefixOf usernameWithoutTrailingDollar) allowedFirstChars
		,A.consistsOf allowedInteriorChars usernameWithoutTrailingDollar
		,A.hasLengthAtMost 32 username p
		]
	in L.and conditions
let example0 = assert : L.isTrue (goodUsername "_bob123$" L.QED)
let example1 = assert : L.isTrue (goodUsername "mike_taylor" L.QED)
let example2 = assert : L.isTrue (goodUsername "funny_lolcat_123$" L.QED)
let example3 = assert : L.isTrue (goodUsername "_1111111111111111111111111111111" L.QED)
let example4 = assert : L.isTrue (goodUsername "_$" L.QED)
let example5 = assert : L.isFalse (goodUsername "_11111111111111111111111111111111" L.QED)
let example6 = assert : L.isFalse (goodUsername "2much" L.QED)
let example7 = assert : L.isFalse (goodUsername "johnny_ca$h" L.QED)
let example8 = assert : L.isFalse (goodUsername "" L.QED)
in goodUsername
