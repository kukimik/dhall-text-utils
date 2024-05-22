let Prelude = ../Prelude.dhall
let TextBool = ../Logic/TextBool.dhall
let isTrue = ../Logic/isTrue.dhall
let isFalse = ../Logic/isFalse.dhall
let consistsOf = ./consistsOf.dhall
let contains = ./contains.dhall
let QED = ../Logic/QED.dhall
let hasLengthAtLeastUsing : ∀(n : Natural) -> ∀(characterClass : List Text) -> ∀(t : Text) -> (isTrue (consistsOf characterClass t)) -> TextBool
  = \(n : Natural) -> \(characterClass : List Text) -> \(t : Text) -> \(p : (isTrue (consistsOf characterClass t))) ->
    contains
      (Prelude.Text.replicate n "x")
      (List/fold Text characterClass Text (\(c : Text) -> Text/replace c "x") t)
let example0 =
      let ASCII = ../CharacterClasses/ASCII.dhall
      in assert : isTrue (hasLengthAtLeastUsing 6 ASCII "Hello!" QED)
let example1 =
      assert : isTrue (hasLengthAtLeastUsing 0 ([] : List Text) "" QED)
let example2 =
      assert : isTrue (hasLengthAtLeastUsing 0 ["a"] "" QED)
let example3 =
      assert : isFalse (hasLengthAtLeastUsing 1 ["a"] "" QED)
let example4 =
      assert : isTrue (hasLengthAtLeastUsing 3 ["a","b","c"] "abba" QED)
in hasLengthAtLeastUsing
