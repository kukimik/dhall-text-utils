{-|
Returns `true` if `needle` is a substring of `haystack`
and `false` otherwise.

Note that this is `isContainedIn` with reversed argument order.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let not = ../Logic/not.dhall

let or = ../Logic/or.dhall

let equals = ./equals.dhall

let isEmpty = ./isEmpty.dhall

let contains =
      λ(needle : Text) →
      λ(haystack : Text) →
        or
          [ not (equals haystack (Text/replace needle "" haystack))
          , isEmpty needle
          ]

let example0 = assert : isTrue (contains "ab" "abcd")

let example1 = assert : isTrue (contains "bc" "abcd")

let example2 = assert : isTrue (contains "cd" "abcd")

let example3 = assert : isTrue (contains "" "x")

let example4 = assert : isTrue (contains "x" "x")

let example5 = assert : isTrue (contains "" "")

let example6 = assert : isFalse (contains "ac" "abcd")

let example7 = assert : isFalse (contains "x" "")

in  contains
