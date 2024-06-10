{-|
The unique `TextBool` value corresponding to truth.
-}
let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ./TextBool.dhall

let true
    : TextBool
    = { `80b81b0c0bbf55ebb04bdadd9c70094a` = "x" }

in  true
