let Prelude = ../../Prelude.dhall
let TextBool = ./TextBool.dhall
let not = ./not.dhall
let or = ./or.dhall
let and : List TextBool -> TextBool =
	\(vs : List TextBool) -> not (or (Prelude.List.map TextBool TextBool not vs))
in and