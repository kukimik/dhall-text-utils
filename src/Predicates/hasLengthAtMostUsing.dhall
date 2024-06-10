{-|
The second argument is assumed to be a character class.

The third argument must consist of codepoints belonging to
the second argument. This is verified by the fourth argument.

Returns `true` if the third argument has has length less or equal
to the value of the first argument.

Returns `false` otherwise.

By the length of a string we understand the number of codepoints
it consists of.
-}
let Prelude = ../Prelude.dhall

let TextBool = ../Logic/TextBool.dhall

let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let consistsOf = ./consistsOf.dhall

let contains = ./contains.dhall

let QED = ../Logic/QED.dhall

let hasLengthAtMostUsing
    : ∀(n : Natural) →
      ∀(characterClass : List Text) →
      ∀(t : Text) →
      isTrue (consistsOf characterClass t) →
        TextBool
    = λ(n : Natural) →
      λ(characterClass : List Text) →
      λ(t : Text) →
      λ(p : isTrue (consistsOf characterClass t)) →
        contains
          ( List/fold
              Text
              characterClass
              Text
              (λ(c : Text) → Text/replace c "x")
              t
          )
          (Prelude.Text.replicate n "x")

let example0 =
      let ASCII = ../CharacterClasses/ASCII.dhall

      in  assert : isTrue (hasLengthAtMostUsing 6 ASCII "Hello!" QED)

let example1 = assert : isTrue (hasLengthAtMostUsing 0 ([] : List Text) "" QED)

let example2 = assert : isTrue (hasLengthAtMostUsing 0 [ "a" ] "" QED)

let example3 = assert : isTrue (hasLengthAtMostUsing 1 [ "a" ] "" QED)

let example4 =
      assert : isFalse (hasLengthAtMostUsing 3 [ "a", "b", "c" ] "abba" QED)

in  hasLengthAtMostUsing
