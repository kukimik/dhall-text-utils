{-|
Returns `true` if the first argument is a suffix of the second argument.

Note that this is `isSuffixOf` with reversed argument order.
-}
let isTrue =
        missing
          sha256:16fc04e94ba9463ad527f6e83982c8d9c6f674046e1797d93de777847c837339
      ? ../Logic/isTrue.dhall

let isFalse =
        missing
          sha256:f6ee161dbe69940a3c09dd60f5946cb5fe6e216d5064811116bd87193d06b49d
      ? ../Logic/isFalse.dhall

let or =
        missing
          sha256:a496c89dbc9d7442d50cf29278496ae0b187a342d8965994658f3963623f0f2d
      ? ../Logic/or.dhall

let not =
        missing
          sha256:cb09ed1bcee1bd18e8bfba89a6fd7bb08657115940b322f98c86daa80e066bc8
      ? ../Logic/not.dhall

let isEmpty =
        missing
          sha256:05f098b4410b29a005fe12a41c0977ea199c45a55cf8bc0289b200cb278afe4c
      ? ./isEmpty.dhall

let equals =
        missing
          sha256:87b2f20b98f83037148fc9cf5b56054f4a20950b374f1e91dd7e4d81d8bdab72
      ? ./equals.dhall

let stripSuffix =
        missing
          sha256:aab951c696c3f31746c723add2642b51f9e30700ad1f898a8e1023876fb1518f
      ? ../Transformations/stripSuffix.dhall

let hasSuffix =
      λ(suffix : Text) →
      λ(text : Text) →
        or [ isEmpty suffix, not (equals text (stripSuffix suffix text)) ]

let example0 = assert : isFalse (hasSuffix "ab" "abcd")

let example1 = assert : isTrue (hasSuffix "cd" "abcd")

let example2 = assert : isTrue (hasSuffix "" "abcd")

let example3 = assert : isTrue (hasSuffix "" "")

in  hasSuffix
