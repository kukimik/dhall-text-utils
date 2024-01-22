let any = ../Logic/any.dhall
let TextBool = ../Logic/contains.dhall
let isContainedIn = ./isContainedIn.dhall
let containsOneOf : ( ts : List Text ) -> ( t : Text ) -> TextBool
 = \( ts : List Text ) -> \( t : Text ) -> any Text (isContainedIn t) ts 
in containsOneOf
