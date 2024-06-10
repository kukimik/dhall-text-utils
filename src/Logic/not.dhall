{-|
Given `true` returns `false`. Given `false` returns `true`.
-}
let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ./TextBool.dhall

let true =
        missing
          sha256:098e2a4f266678afc95037a722ff69fa1c4d98c89928da1dc1b2dddb5d68a9a7
      ? ./true.dhall

let false =
        missing
          sha256:c990252cf2441a503374aee2126c51d5bc7dc40fce0c2d5bb95afcf0e6e3c880
      ? ./false.dhall

let not
    : TextBool → TextBool
    = λ(v : TextBool) →
        { `80b81b0c0bbf55ebb04bdadd9c70094a` =
            Text/replace "xx" "" "${v.`80b81b0c0bbf55ebb04bdadd9c70094a`}x"
        }

let example0 = false ≡ not true

let example1 = true ≡ not false

in  not
