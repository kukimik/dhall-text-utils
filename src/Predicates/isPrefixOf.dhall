{-|
Returns `true` if the second argument is a prefix of the first argument.
Returns `false` otherwise.

Note that this is `hasPrefix` with reversed argument order.
-}
let isTrue =
        missing
          sha256:16fc04e94ba9463ad527f6e83982c8d9c6f674046e1797d93de777847c837339
      ? ../Logic/isTrue.dhall

let isFalse =
        missing
          sha256:f6ee161dbe69940a3c09dd60f5946cb5fe6e216d5064811116bd87193d06b49d
      ? ../Logic/isFalse.dhall

let hasPrefix =
        missing
          sha256:4d0ad8d4fb10d73855730baa9a12fc656a25fa8611ba6c8e68e6f2d584061452
      ? ./hasPrefix.dhall

let isPrefixOf = \(text : Text) -> \(prefix : Text) -> hasPrefix prefix text

let example0 = assert : isTrue (isPrefixOf "abcd" "ab")

let example1 = assert : isFalse (isPrefixOf "cd" "abcd")

let example2 = assert : isTrue (isPrefixOf "abcd" "")

let example3 = assert : isTrue (isPrefixOf "" "")

in  isPrefixOf
