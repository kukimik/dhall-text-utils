{-|
Returns `true` if the second argument is a substring of the first argument.
and `false` otherwise.

Note that this is `contains` with reversed argument order.
-}
let isTrue =
        missing
          sha256:16fc04e94ba9463ad527f6e83982c8d9c6f674046e1797d93de777847c837339
      ? ../Logic/isTrue.dhall

let isFalse =
        missing
          sha256:f6ee161dbe69940a3c09dd60f5946cb5fe6e216d5064811116bd87193d06b49d
      ? ../Logic/isFalse.dhall

let contains =
        missing
          sha256:5901c965285fac07afeb487d88a28cfb680831d57317ff93f7193ec5a31d9195
      ? ./contains.dhall

let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ../Logic/TextBool.dhall

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
