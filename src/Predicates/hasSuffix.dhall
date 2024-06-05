{-|
Returns `true` if the first argument is a suffix of the second argument.

Note that this is `isSuffixOf` with reversed argument order.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let or = ../Logic/or.dhall

let not = ../Logic/not.dhall

let isEmpty = ./isEmpty.dhall

let equals = ./equals.dhall

let stripSuffix = ../Transformations/stripSuffix.dhall

let hasSuffix =
      λ(suffix : Text) →
      λ(text : Text) →
        or [ isEmpty suffix, not (equals text (stripSuffix suffix text)) ]

let example0 = assert : isFalse (hasSuffix "ab" "abcd")

let example1 = assert : isTrue (hasSuffix "cd" "abcd")

let example2 = assert : isTrue (hasSuffix "" "abcd")

let example3 = assert : isTrue (hasSuffix "" "")

in  hasSuffix
