{-|
If the first argument is `true`, returns the second argument.
If the first argument is `false`, returns the third argument.
-}
let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ./TextBool.dhall

let not =
        missing
          sha256:cb09ed1bcee1bd18e8bfba89a6fd7bb08657115940b322f98c86daa80e066bc8
      ? ./not.dhall

let true =
        missing
          sha256:098e2a4f266678afc95037a722ff69fa1c4d98c89928da1dc1b2dddb5d68a9a7
      ? ./true.dhall

let false =
        missing
          sha256:c990252cf2441a503374aee2126c51d5bc7dc40fce0c2d5bb95afcf0e6e3c880
      ? ./false.dhall

let ifThenElse =
      λ(condition : TextBool) →
      λ(valueIfTrue : Text) →
      λ(valueIfFalse : Text) →
            Text/replace
              "x"
              valueIfTrue
              condition.`80b81b0c0bbf55ebb04bdadd9c70094a`
        ++  Text/replace
              "x"
              valueIfFalse
              (not condition).`80b81b0c0bbf55ebb04bdadd9c70094a`

let example0 = "a" ≡ ifThenElse true "a" "b"

let example1 = "b" ≡ ifThenElse false "a" "b"

in  ifThenElse
