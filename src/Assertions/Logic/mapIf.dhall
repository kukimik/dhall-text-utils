let TextBool = ./TextBool.dhall
let vtb = ./vtb.dhall
let not = ./not.dhall
let mapIf =
 \(condition : Text -> TextBool) -> \(ifTrue : Text -> Text) -> \(ifFalse : Text -> Text) -> \(input : Text) ->
 	let evaluatedCondition = condition input
 	in  (Text/replace "x" (ifTrue input) evaluatedCondition.vtb) ++ (Text/replace "x" (ifFalse input) (not evaluatedCondition).vtb)
in mapIf 