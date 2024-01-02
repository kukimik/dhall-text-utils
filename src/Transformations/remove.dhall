{-|
The `remove` function replaces all occurences of the substring
`needle` in `haystack` with an empty string and returns the
resulting `Text`.

Note that in result of this operation new occurences of `needle`
may appear, which are **not** removed reursively.
-}
let remove
    : Text → Text → Text
    = λ(needle : Text) → λ(haystack : Text) →
        Text/replace needle "" haystack

let example0 = assert : remove "def" "abcdefghidef" ≡ "abcghi"

let example1 = assert : remove "123" "Hello" ≡ "Hello"

let example2 = assert : remove "ab" "aabb" ≡ "ab"

let example3 = assert : remove "123" "Hello" ≡ "Hello"

in remove
