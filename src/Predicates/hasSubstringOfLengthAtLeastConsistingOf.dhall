{-|
The second argument is assumed to be a character class.

Returns `true` if the third argument has a substring consisting of
the codepoints belonging to the second argument, that has length
given by the first argument.

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

let bool2TextBool =
        missing
          sha256:1be849e788bde277e367c3439ec2f2d1f53ab0df1b59d6b5019b1620d58e5057
      ? ../Logic/bool2TextBool.dhall

let isTrue =
        missing
          sha256:16fc04e94ba9463ad527f6e83982c8d9c6f674046e1797d93de777847c837339
      ? ../Logic/isTrue.dhall

let isFalse =
        missing
          sha256:f6ee161dbe69940a3c09dd60f5946cb5fe6e216d5064811116bd87193d06b49d
      ? ../Logic/isFalse.dhall

let isContainedIn =
        missing
          sha256:e75e0e8042f46f80f6ac2a6790f51e21ddb32a92278ffe1b2b2e398a6fcf17cb
      ? ./isContainedIn.dhall

let hasSubstringOfLengthAtLeastConsistingOf
    : ∀(length : Natural) →
      ∀(characters : List Text) →
      ∀(text : Text) →
        TextBool
    = λ(length : Natural) →
      λ(characters : List Text) →
      λ(text : Text) →
        merge
          { None = bool2TextBool (Natural/isZero length)
          , Some =
              λ(char : Text) →
                isContainedIn
                  ( List/fold
                      Text
                      characters
                      Text
                      (λ(c : Text) → Text/replace c char)
                      text
                  )
                  (Prelude.Text.replicate length char)
          }
          (List/head Text characters)

let example0 =
        assert
      : isTrue
          ( hasSubstringOfLengthAtLeastConsistingOf
              3
              [ "0", "1", "2", "3", "4" ]
              "aaa123bbb"
          )

let example1 =
        assert
      : isFalse
          ( hasSubstringOfLengthAtLeastConsistingOf
              4
              [ "0", "1", "2", "3", "4" ]
              "aaa123bbb"
          )

let example2 =
        assert
      : isTrue (hasSubstringOfLengthAtLeastConsistingOf 0 ([] : List Text) "")

let example3 =
        assert
      : isTrue
          (hasSubstringOfLengthAtLeastConsistingOf 0 ([ "x" ] : List Text) "")

let example4 =
        assert
      : isFalse
          (hasSubstringOfLengthAtLeastConsistingOf 1 ([] : List Text) "abc")

let example4 =
        assert
      : isTrue
          (hasSubstringOfLengthAtLeastConsistingOf 0 ([] : List Text) "abc")

in  hasSubstringOfLengthAtLeastConsistingOf
