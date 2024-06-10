{-|
The second argument is assumed to be a character class.

Returns `true` if the third argument has a substring consisting of
the codepoints belonging to the second argument, that has length
given by the first argument.

Returns `false` otherwise.

By the length of a string we understand the number of codepoints
it consists of.
-}
let Prelude = ../Prelude.dhall

let TextBool = ../Logic/TextBool.dhall

let bool2TextBool = ../Logic/bool2TextBool.dhall

let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let isContainedIn = ./isContainedIn.dhall

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
