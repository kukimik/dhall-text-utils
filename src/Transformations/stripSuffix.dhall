{-|
If `suffix` is a suffix of the string `text`, the `stripSuffix`
function returns `text` with the suffix removed. Otherwise
it returns unchanged `text`.
-}
let stripSuffix
    : ∀(suffix : Text) → ∀(text : Text) → Text
    = λ(suffix : Text) →
      λ(text : Text) →
        let helper = "^" ++ text

        in  ./foldRemove.dhall [ helper, helper ++ suffix ] (helper ++ text)

let example0 = assert : stripSuffix "abc" "abcdef" ≡ "abcdef"

let example1 = assert : stripSuffix "def" "abcdef" ≡ "abc"

let example2 = assert : stripSuffix "" "abc" ≡ "abc"

let example3 = assert : stripSuffix "abc" "" ≡ ""

let example4 = assert : stripSuffix "" "" ≡ ""

let example5 = assert : stripSuffix "abc" "defabcabc" ≡ "defabc"

in  stripSuffix
