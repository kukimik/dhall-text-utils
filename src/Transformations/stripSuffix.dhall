{-|
The function takes two strings. If the first one is a suffix
of the second, it returns the remainder of the second string.
Otherwise it returns the second string unchanged.
-}
let stripSuffix
    : ∀(suffix : Text) → ∀(text : Text) → Text
    = λ(suffix : Text) →
      λ(text : Text) →
        let helper = "${Text/show text}\t"

        in  ./foldRemove.dhall [ helper, suffix ++ helper ] (text ++ helper) --- BUG, use Text/show instead (helper may be contained in text + initial fragment of text (cotained in helper))

let example0 = assert : stripSuffix "abc" "abcdef" ≡ "abcdef"

let example1 = assert : stripSuffix "def" "abcdef" ≡ "abc"

let example2 = assert : stripSuffix "" "abc" ≡ "abc"

let example3 = assert : stripSuffix "abc" "" ≡ ""

let example4 = assert : stripSuffix "" "" ≡ ""

let example5 = assert : stripSuffix "abc" "defabcabc" ≡ "defabc"

in  stripSuffix
