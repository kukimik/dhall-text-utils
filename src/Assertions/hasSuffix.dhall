let hasSuffix = \(suffix : Text) -> \(text : Text) -> 
	./notEqual.dhall text ((./helpers/empty2x suffix) ++ (Text/replace ../Transformations/stripSuffix suffix text))

in hasSuffix
