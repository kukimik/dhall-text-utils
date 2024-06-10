{-|
Given a list of `TextBool` values returns `true` if at least one
element of the list is `true` and returns `false` otherwise.
-}
-- if t === "" it outputs ""
-- otherwise it outputs "x"
let nonempty2x = λ(t : Text) → Text/replace t "x" t

let Prelude =
        missing
          sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871
      ? ../Prelude.dhall

let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ./TextBool.dhall

let getVtb = λ(t : TextBool) → t.`80b81b0c0bbf55ebb04bdadd9c70094a`

let true =
        missing
          sha256:098e2a4f266678afc95037a722ff69fa1c4d98c89928da1dc1b2dddb5d68a9a7
      ? ./true.dhall

let false =
        missing
          sha256:c990252cf2441a503374aee2126c51d5bc7dc40fce0c2d5bb95afcf0e6e3c880
      ? ./false.dhall

let or
    : List TextBool → TextBool
    = λ(vs : List TextBool) →
        { `80b81b0c0bbf55ebb04bdadd9c70094a` =
            nonempty2x (Prelude.Text.concatMap TextBool getVtb vs)
        }

let example0 = true ≡ or [ false, true, true ]

let example1 = false ≡ or [ false, false, false ]

let example2 = false ≡ or ([] : List TextBool)

in  or
