{-|
Returns `true` if the `Text` values `t1` and `t2` are the same.
Returns `false` otherwise.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let isEmpty = ./isEmpty.dhall

let mutualRemove =
      λ(t1 : Text) →
      λ(t2 : Text) →
        Text/replace t1 "" t2 ++ Text/replace t2 "" t1

let equals = λ(t1 : Text) → λ(t2 : Text) → isEmpty (mutualRemove t1 t2)

let example0 = assert : isFalse (equals "abc" "def")

let example1 = assert : isFalse (equals "" "def")

let example2 = assert : isFalse (equals "abc" "")

let example3 = assert : isTrue (equals "ABC" "ABC")

let example4 = assert : isTrue (equals "" "")

in  equals
