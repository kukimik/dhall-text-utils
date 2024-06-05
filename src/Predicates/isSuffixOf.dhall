{-|
Returns `true` if the second argument is a suffix of the first argument.
Returns `false` otherwise.

Note that this is `hasSuffix` with reversed argument order.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let hasSuffix = ./hasSuffix.dhall

let isSuffixOf = \(text : Text) -> \(suffix : Text) -> hasSuffix suffix text

let example0 = assert : isFalse (isSuffixOf "abcd" "ab")

let example1 = assert : isTrue (isSuffixOf "abcd" "cd")

let example2 = assert : isTrue (isSuffixOf "abcd" "")

let example3 = assert : isTrue (isSuffixOf "" "")

in  isSuffixOf
