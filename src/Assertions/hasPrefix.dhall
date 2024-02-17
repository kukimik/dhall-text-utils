{-|
Returns `true` if `prefix` is a prefix of `text`.
Returns `false` otherwise.

Note that this is `isPrefixOf` with reversed argument order.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let or = ../Logic/or.dhall

let not = ../Logic/not.dhall

let isEmpty = ./isEmpty.dhall

let equals = ./equals.dhall

let stripPrefix = ../Transformations/stripPrefix.dhall

let hasPrefix =
      λ(prefix : Text) →
      λ(text : Text) →
        or [ isEmpty prefix, not (equals text (stripPrefix prefix text)) ]

let example0 = assert : isTrue (hasPrefix "ab" "abcd")

let example1 = assert : isFalse (hasPrefix "abcd" "cd")

let example2 = assert : isTrue (hasPrefix "abcd" "")

let example3 = assert : isTrue (hasPrefix "" "")

in  hasPrefix
