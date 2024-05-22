{-|
Given a character class `characters` returns `true` if `text` consists entirely of
characters belonging to `characters` and returns `false` otherwise.

Behaviour is undefined if `characters` is not a character class.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let isEmpty = ./isEmpty.dhall

let foldRemove = ../Transformations/foldRemove.dhall

let consistsOf =
      λ(characters : List Text) →
      λ(text : Text) →
        isEmpty (foldRemove characters text)

let example0 =
      assert : isTrue (consistsOf [ ".", "-", " " ] "-.. .... .- .-.. .-..")

let example1 = assert : isTrue (consistsOf ([] : List Text) "")

let example2 = assert : isTrue (consistsOf [ "A", "B", "C" ] "AAA")

let example3 = assert : isFalse (consistsOf [ "A", "B" ] "ABC")

in  consistsOf
