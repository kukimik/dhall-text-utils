{-|
Given a list of `TextBool` values returns `true` if every
element of the list is `true` and returns `false` otherwise.
-}
let Prelude =
        missing
          sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871
      ? ../Prelude.dhall

let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ./TextBool.dhall

let not =
        missing
          sha256:cb09ed1bcee1bd18e8bfba89a6fd7bb08657115940b322f98c86daa80e066bc8
      ? ./not.dhall

let or =
        missing
          sha256:a496c89dbc9d7442d50cf29278496ae0b187a342d8965994658f3963623f0f2d
      ? ./or.dhall

let true =
        missing
          sha256:098e2a4f266678afc95037a722ff69fa1c4d98c89928da1dc1b2dddb5d68a9a7
      ? ./true.dhall

let false =
        missing
          sha256:c990252cf2441a503374aee2126c51d5bc7dc40fce0c2d5bb95afcf0e6e3c880
      ? ./false.dhall

let and
    : List TextBool → TextBool
    = λ(vs : List TextBool) →
        not (or (Prelude.List.map TextBool TextBool not vs))

let example0 = assert : true ≡ and [ true, true ]

let example1 = assert : false ≡ and [ true, false, true ]

let example2 = assert : true ≡ and ([] : List TextBool)

in  and
