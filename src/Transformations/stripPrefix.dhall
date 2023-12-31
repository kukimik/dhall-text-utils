let stripPrefix = \(prefix : Text) -> \(text : Text) ->
	let helperPrefix = "^" ++ text
	in
	  ./remove.dhall
	  	helperPrefix
	  	(
	  	 ./remove.dhall
		  (helperPrefix ++ prefix)
		  (helperPrefix ++ text)
		)
