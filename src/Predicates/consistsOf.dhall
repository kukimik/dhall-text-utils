{-|
The first argument should be a a character class.

Under this assumption the function returns `true` if the second argument
consists entirely of characters belonging to first argument, and returns `false`
otherwise.

Behaviour is undefined if the firsr argument is not a character class.
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
