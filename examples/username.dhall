{-
The function `goodUsername` checks whether the provided string follows the
recommendations for a Linux username specified in the man page of `useradd`:

> It is usually recommended to only use usernames that begin with a lower case letter or an underscore, followed by lower case letters, digits, underscores, or
> dashes. They can end with a dollar sign. In regular expression terms: `[a-z_][a-z0-9_-]*[$]?`
>
> [...]
>
> Usernames may only be up to 32 characters long.
-}
let L = ../src/Logic/package.dhall
let A = ../src/Assertions/package.dhall
let C = ../src/CharacterClasses/package.dhall
let T = ../src/Transformations/package.dhall
let goodUsername = \(username : Text) ->
	let usernameWithoutTrailingDollar = T.stripSuffix "$" username
	let allowedFirstChars = ["_"] # C.ASCIIlower
	let allowedInteriorChars = allowedFirstChars # C.ASCIIdigit
	let allowedChars = ["$"] # allowedInteriorChars
	let maxLength = 32
	let conditions =
		[
		 L.any Text (A.isPrefixOf usernameWithoutTrailingDollar) allowedFirstChars
		,A.consistsOf allowedInteriorChars usernameWithoutTrailingDollar
		,L.not (A.hasSubstringOfLengthAtLeastConsistingOf (maxLength + 1) allowedChars username)
		]
	in L.and conditions
let example0 = assert : L.isTrue (goodUsername "_bob123$")
let example1 = assert : L.isTrue (goodUsername "mike_taylor")
let example2 = assert : L.isTrue (goodUsername "funny_lolcat_123$")
let example3 = assert : L.isTrue (goodUsername "_1111111111111111111111111111111")
let example4 = assert : L.isTrue (goodUsername "_$")
let example5 = assert : L.isFalse (goodUsername "_11111111111111111111111111111111")
let example6 = assert : L.isFalse (goodUsername "2much")
let example7 = assert : L.isFalse (goodUsername "johnny_ca$h")
let example8 = assert : L.isFalse (goodUsername "")
in goodUsername
