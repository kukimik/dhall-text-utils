let contains = ../Assertions/contains.dhall
let and = ./and.dhall
let or = ./or.dhall
let not = ./not.dhall
let ifThenElse = ./ifThenElse.dhall
let false = ./false.dhall
let true = ./true.dhall
let TextBool = ./TextBool.dhall

let Result = { wasFound : TextBool, value : Text }

let findFirst :
	∀(condition : Text → TextBool) → ∀(ts : List Text) → Result
	=  \(condition : Text → TextBool) -> \(ts : List Text) ->
		let f = \(t : Text) -> \( r : Result ) ->
			{
			 wasFound = or [condition t, r.wasFound]
			,value = 
				ifThenElse
					(and [not r.wasFound, condition t])
					t
					r.value
			}
		in List/fold Text ts Result f { wasFound = false, value = "" }

let example0 = findFirst (contains "abc") ["abc", "def", "ghiabc", "jkl"] === { wasFound = true, value = "ghiabc" }
let example1 = findFirst (contains "mno") ["abc", "def", "ghiabc", "jkl"] === { wasFound = false, value = "" }

in findFirst
