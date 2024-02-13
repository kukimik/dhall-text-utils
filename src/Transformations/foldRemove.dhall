{-|
Consecutively replaces all occurences of the elements of
`needles` as substrings in `haystack` with the empty string.

The `needles` list is processed from right to left. First, the
last element of `needles` is removed (i.e. replaced with the empty
string) from `haystack`. Then, the next-to-last element of `needles`
is removed from the resulting text, and so on.
-}
let remove =
      λ(needle : Text) → λ(haystack : Text) → Text/replace needle "" haystack

let foldRemove
    : List Text → Text → Text
    = λ(needles : List Text) →
      λ(haystack : Text) →
        List/fold Text needles Text remove haystack

let example0 = assert : foldRemove [ "ccc", "bb", "a" ] "ccbabcc" ≡ "c"

let example1 = assert : foldRemove [ "ab", "ab" ] "aaabbb" ≡ "ab"

in  foldRemove
