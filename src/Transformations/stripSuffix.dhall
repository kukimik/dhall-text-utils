let stripSuffix = \(suffix : Text) -> \(text : Text) ->
	let helperSuffix = text ++ "$"
	in
	  ./remove.dhall
	  	helperSuffix
	  	(
	  	 ./remove.dhall
		  (suffix ++ helperSuffix)
		  (text ++ helperSuffix)
		)