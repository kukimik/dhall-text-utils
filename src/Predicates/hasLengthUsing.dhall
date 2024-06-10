{-|
The second argument is assumed to be a character class.

The third argument must consist of codepoints belonging to
the second argument. This is verified by the fourth argument.

Returns `true` if the third argument has has length equal
to the value of the first argument.

Returns `false` otherwise.

By the length of a string we understand the number of codepoints
it consists of.
-}
let Prelude =
        missing
          sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871
      ? ../Prelude.dhall

let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ../Logic/TextBool.dhall

let isTrue =
        missing
          sha256:16fc04e94ba9463ad527f6e83982c8d9c6f674046e1797d93de777847c837339
      ? ../Logic/isTrue.dhall

let isFalse =
        missing
          sha256:f6ee161dbe69940a3c09dd60f5946cb5fe6e216d5064811116bd87193d06b49d
      ? ../Logic/isFalse.dhall

let consistsOf =
        missing
          sha256:2cf5d7ed4f27a88ed8f795c9b95c61f769dc9efec9beb717fb8b02f8623c5cad
      ? ./consistsOf.dhall

let equals =
        missing
          sha256:87b2f20b98f83037148fc9cf5b56054f4a20950b374f1e91dd7e4d81d8bdab72
      ? ./equals.dhall

let QED =
        missing
          sha256:ecf97ef7ad2bfa23579f9ca755e91cd12543a15b099c769003bab0524298e727
      ? ../Logic/QED.dhall

let hasLengthUsing
    : ∀(n : Natural) →
      ∀(characterClass : List Text) →
      ∀(t : Text) →
      isTrue (consistsOf characterClass t) →
        TextBool
    = λ(n : Natural) →
      λ(characterClass : List Text) →
      λ(t : Text) →
      λ(p : isTrue (consistsOf characterClass t)) →
        equals
          ( List/fold
              Text
              characterClass
              Text
              (λ(c : Text) → Text/replace c "x")
              t
          )
          (Prelude.Text.replicate n "x")

let example0 =
      let ASCII =
              missing
                sha256:a2f5fdd4ccef40ef2bc9acab701b310831f84b94ca9859294a0304598953b74c
            ? ../CharacterClasses/ASCII.dhall

      in  assert : isTrue (hasLengthUsing 6 ASCII "Hello!" QED)

let example1 = assert : isTrue (hasLengthUsing 0 ([] : List Text) "" QED)

let example2 = assert : isTrue (hasLengthUsing 0 [ "a" ] "" QED)

let example3 = assert : isFalse (hasLengthUsing 1 [ "a" ] "" QED)

let example4 = assert : isFalse (hasLengthUsing 3 [ "a", "b", "c" ] "abba" QED)

in  hasLengthUsing
