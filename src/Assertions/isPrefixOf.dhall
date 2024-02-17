{-|
Returns `true` if `prefix` is a prefix of `text`.
Returns `false` otherwise.

Note that this is `hasPrefix` with reversed argument order.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let hasPrefix = ./hasPrefix.dhall

let isPrefixOf = \(text : Text) -> \(prefix : Text) -> hasPrefix prefix text

let example0 = assert : isTrue (isPrefixOf "abcd" "ab")

let example1 = assert : isFalse (isPrefixOf "cd" "abcd")

let example2 = assert : isTrue (isPrefixOf "" "abcd")

let example3 = assert : isTrue (isPrefixOf "" "")

in  isPrefixOf
