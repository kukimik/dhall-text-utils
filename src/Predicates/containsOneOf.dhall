{-|
Returns `true` if the second argument contains at least one element of the first
argument as a substring.
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

let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ../Logic/TextBool.dhall

let isContainedIn =
        missing
          sha256:e75e0e8042f46f80f6ac2a6790f51e21ddb32a92278ffe1b2b2e398a6fcf17cb
      ? ./isContainedIn.dhall

let containsOneOf
    : ∀(ts : List Text) → ∀(t : Text) → TextBool
    = λ(ts : List Text) → λ(t : Text) → any Text (isContainedIn t) ts

let example0 =
        assert
      : isTrue (containsOneOf [ "John", "Jack", "Alice" ] "Bob and Alice")

let example1 = assert : isTrue (containsOneOf [ "a", "b", "c" ] "abc")

let example2 = assert : isTrue (containsOneOf [ "" ] "")

let example3 =
        assert
      : isFalse
          (containsOneOf [ "Andrew", "Bob", "Celine" ] "Dave, Ed and Frank")

in  containsOneOf
