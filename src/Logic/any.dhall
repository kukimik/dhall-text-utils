{-|
Given a list of values of type `a` and a predicate-like
function that maps a value of type `a` to a `TextBool` value,
returns `true` if the predicate function returns `true` for
at least one element of the list and returns `false` otherwise.
-}
let Prelude =
        missing
          sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871
      ? ../Prelude.dhall

let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ./TextBool.dhall

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

let any
    : ∀(a : Type) → ∀(f : a → TextBool) → List a → TextBool
    = λ(a : Type) →
      λ(f : a → TextBool) →
      λ(vs : List a) →
        or (Prelude.List.map a TextBool f vs)

let example0 =
      let contains =
              missing
                sha256:5901c965285fac07afeb487d88a28cfb680831d57317ff93f7193ec5a31d9195
            ? ../Predicates/contains.dhall

      in  true ≡ any Text (contains "a") [ "b", "abc", "def", "baba" ]

let example1 =
      let isEmpty =
              missing
                sha256:05f098b4410b29a005fe12a41c0977ea199c45a55cf8bc0289b200cb278afe4c
            ? ../Predicates/isEmpty.dhall

      in  false ≡ any Text isEmpty [ "I am not empty.", "Hi!", "Hello!" ]

let example2 =
        false
      ≡ any TextBool (Prelude.Function.identity TextBool) ([] : List TextBool)

in  any
