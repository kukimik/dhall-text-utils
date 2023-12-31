let hasPrefix = \(prefix : Text) -> \(text : Text) -> 
	./notEqual.dhall text ((./helpers/empty2x prefix) ++ (Text/replace ../Transformations/stripPrefix prefix text))

in hasPrefix
