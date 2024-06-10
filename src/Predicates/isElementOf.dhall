{-|
Returns `true` if the second argument is an element of the first argument.
Returns `false` otherwise.
-}
let isTrue =
        missing
          sha256:16fc04e94ba9463ad527f6e83982c8d9c6f674046e1797d93de777847c837339
      ? ../Logic/isTrue.dhall

let isFalse =
        missing
          sha256:f6ee161dbe69940a3c09dd60f5946cb5fe6e216d5064811116bd87193d06b49d
      ? ../Logic/isFalse.dhall

let any =
        missing
          sha256:4afa4db0d7ab21387f7fe2b56e16f159aff0afd4739e4cf1dbaebc3be7cb5b27
      ? ../Logic/any.dhall

let equals =
        missing
          sha256:87b2f20b98f83037148fc9cf5b56054f4a20950b374f1e91dd7e4d81d8bdab72
      ? ./equals.dhall

let isElementOf = λ(ts : List Text) → λ(t : Text) → any Text (equals t) ts

let example0 = assert : isTrue (isElementOf [ "red", "green", "blue" ] "green")

let example1 = assert : isFalse (isElementOf [ "red", "green", "blue" ] "cyan")

in  isElementOf
