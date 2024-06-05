{-|
Returns `true` if the second argument is a substring of the first argument.
and `false` otherwise.

Note that this is `contains` with reversed argument order.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let contains = ./contains.dhall

let TextBool = ../Logic/TextBool.dhall

let isContainedIn
    : ∀(haystack : Text) → ∀(needle : Text) → TextBool
    = λ(haystack : Text) → λ(needle : Text) → contains needle haystack

let example0 = assert : isTrue (isContainedIn "abcd" "ab")

let example1 = assert : isTrue (isContainedIn "abcd" "bc")

let example2 = assert : isTrue (isContainedIn "abcd" "cd")

let example3 = assert : isTrue (isContainedIn "x" "")

let example4 = assert : isTrue (isContainedIn "x" "x")

let example5 = assert : isTrue (isContainedIn "" "")

let example6 = assert : isFalse (isContainedIn "abcd" "ac")

let example7 = assert : isFalse (isContainedIn "" "x")

in  isContainedIn
