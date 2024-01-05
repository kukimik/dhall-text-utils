let Prelude = ../../Prelude.dhall
let TextBool = ./TextBool.dhall
let vtb = ./vtb.dhall
let or : List TextBool -> TextBool =
	\(vs : List TextBool) ->
		{ vtb = ../helpers/nonempty2x.dhall (Prelude.Text.concatMap TextBool vtb vs) }
in or
