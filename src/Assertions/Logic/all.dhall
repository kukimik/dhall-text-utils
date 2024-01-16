let Prelude = ../../Prelude.dhall
let TextBool = ./TextBool.dhall
let or = ./or.dhall
let all : (a : Type) -> (f : a -> TextBool) -> List a -> TextBool =
		 \(a : Type) -> \(f : a -> TextBool) -> \(vs : List a) ->
			and (Prelude.List.map a TextBool f vs)
in all