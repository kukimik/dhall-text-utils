--------- misc utilities

v 0.4.0


???? proofs ????

let stripPrefix = \(prefix : Text) -> \(text : Text) ->
	let helperPrefix = "^" ++ text
	in
	  remove
	  	helperPrefix
	  	(
	  	 remove 
		  (helperPrefix ++ prefix)
		  (helperPrefix ++ text)
		)

let stripSuffix = \(suffix : Text) -> \(text : Text) ->
	let helperSuffix = text ++ "$"
	in
	  remove
	  	helperSuffix
	  	(
	  	 remove 
		  (suffix ++ helperSuffix)
		  (text ++ helperSuffix)
		)

let hasPrefix

let hasSuffix

let doesNotHavePrefix

let doesNotHaveSuffix

----- for assertions

v 0.1.0

let textDoesNotContain = \(needle : Text) -> \(haystack : Text) -> "" === (remove (haystack ++ haystack) (haystack ++ remove needle haystack))
let textContains = \(needle : Text) -> \(haystack : Text) -> textNotEmpty (remove (haystack ++ haystack) (haystack ++ remove needle haystack))

-----------

v 0.2.0

let textDoesNotContainAnyOf = \(needles : List Text) -> \(haystack : Text) ->
let textContainsAtLeastOneOf = \(needles : List Text) -> \(haystack : Text) ->

-----------

v 0.3.0

let isASCIIAlpha =
let isASCIIAlnum =
let isASCIIPrintable =

let lengthAtLeast =  -- for ASCII only
let lengthAtMost =  -- for ASCII only
