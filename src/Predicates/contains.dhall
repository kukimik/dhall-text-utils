{-|
Returns `true` if the first argument is a substring of the second argument.
Returns `false` otherwise.

Note that this is `isContainedIn` with reversed argument order.
-}
let isTrue =
        missing
          sha256:16fc04e94ba9463ad527f6e83982c8d9c6f674046e1797d93de777847c837339
      ? ../Logic/isTrue.dhall

let isFalse =
        missing
          sha256:f6ee161dbe69940a3c09dd60f5946cb5fe6e216d5064811116bd87193d06b49d
      ? ../Logic/isFalse.dhall

let not =
        missing
          sha256:cb09ed1bcee1bd18e8bfba89a6fd7bb08657115940b322f98c86daa80e066bc8
      ? ../Logic/not.dhall

let or =
        missing
          sha256:a496c89dbc9d7442d50cf29278496ae0b187a342d8965994658f3963623f0f2d
      ? ../Logic/or.dhall

let equals =
        missing
          sha256:87b2f20b98f83037148fc9cf5b56054f4a20950b374f1e91dd7e4d81d8bdab72
      ? ./equals.dhall

let isEmpty =
        missing
          sha256:05f098b4410b29a005fe12a41c0977ea199c45a55cf8bc0289b200cb278afe4c
      ? ./isEmpty.dhall

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
