{-|
Returns `true` if the second argument is a suffix of the first argument.
Returns `false` otherwise.

Note that this is `hasSuffix` with reversed argument order.
-}
let isTrue =
        missing
          sha256:16fc04e94ba9463ad527f6e83982c8d9c6f674046e1797d93de777847c837339
      ? ../Logic/isTrue.dhall

let isFalse =
        missing
          sha256:f6ee161dbe69940a3c09dd60f5946cb5fe6e216d5064811116bd87193d06b49d
      ? ../Logic/isFalse.dhall

let hasSuffix =
        missing
          sha256:9ae8cec62981b511b5441211845aba1a7d4a053b9cafb3f63301611cabcdc6fc
      ? ./hasSuffix.dhall

let isSuffixOf = \(text : Text) -> \(suffix : Text) -> hasSuffix suffix text

let example0 = assert : isFalse (isSuffixOf "abcd" "ab")

let example1 = assert : isTrue (isSuffixOf "abcd" "cd")

let example2 = assert : isTrue (isSuffixOf "abcd" "")

let example3 = assert : isTrue (isSuffixOf "" "")

in  isSuffixOf
