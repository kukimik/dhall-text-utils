{-|
Returns `true` if its argument is the empty string `""`.
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

let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ../Logic/TextBool.dhall

let empty2x = λ(t : Text) → Text/replace "xx" "" ("x" ++ Text/replace t "x" t)

let isEmpty
    : ∀(text : Text) → TextBool
    = λ(text : Text) → { `80b81b0c0bbf55ebb04bdadd9c70094a` = empty2x text }

let example0 = assert : isFalse (isEmpty "abc")

let example1 = assert : isTrue (isEmpty "")

in  isEmpty
