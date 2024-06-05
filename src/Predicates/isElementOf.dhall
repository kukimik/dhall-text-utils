{-|
Returns `true` if the second argument is an element of the first argument.
Returns `false` otherwise.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let any = ../Logic/any.dhall

let equals = ./equals.dhall

let isElementOf =  λ(ts : List Text) → λ(t : Text) → any Text (equals t) ts

let example0 = assert : isTrue (isElementOf [ "red", "green", "blue" ] "green")

let example1 = assert : isFalse (isElementOf [ "red", "green", "blue" ] "cyan")

in  isElementOf
