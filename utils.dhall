--------- misc utilities

let remove = \(needle : Text) -> \(haystack : Text) -> replace needle "" haystack

let removeConsecutively = \(needles : List Text) -> \(haystack : Text) ->

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

----- for assertions

let textNotEmpty = \(t : Text) -> (Text/replace t "x" t === "x")
let textDoesNotContain = \(needle : Text) -> \(haystack : Text) -> "" === (remove (haystack ++ haystack) (haystack ++ remove needle haystack))
let textContains = \(needle : Text) -> \(haystack : Text) -> textNotEmpty (remove (haystack ++ haystack) (haystack ++ remove needle haystack))
let textsNotEqual = \(t1 : Text) -> \(t2 : Text) -> textNotEmpty ((remove t1 t2) ++ (Text/remove t2 t1))

let textDoesNotContainAnyOf = \(needles : List Text) -> \(haystack : Text) ->
let textContainsAtLeastOneOf = \(needles : List Text) -> \(haystack : Text) ->

-- examples, tests!

let isElementOf =
let isNotElementOf =
let allNonEmpty =
let atLeastOneEmpty =

let isASCIIAlpha =
let isASCIIAlnum =
let isASCIIPrintable =

let lengthAtLeast =  -- for ASCIIPrintable only
let lengthAtMost =  -- for ASCIIPrintable only
