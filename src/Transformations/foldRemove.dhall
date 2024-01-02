{-|
TODO: write docs
-}
let foldRemove
    : List Text → Text → Text
    = λ(needles : List Text) →
      λ(haystack : Text) →
        List/fold Text needles Text ./remove.dhall haystack

let example0 = assert : foldRemove [ "c", "b", "a" ] "abcd" ≡ "d"

let example1 = assert : foldRemove [ "ab" ] "abaabb" ≡ "ab"

let example2 = assert : foldRemove [ "ab", "ab" ] "abaabb" ≡ ""

in  foldRemove
