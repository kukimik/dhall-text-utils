{-|
If `prefix` is a prefix of the string `text`, the `stripPrefix`
function returns `text` with the prefix removed. Otherwise
it returns unchanged `text`.
-}
let stripPrefix
    : ∀(prefix : Text) → ∀(text : Text) → Text
    = λ(prefix : Text) →
      λ(text : Text) →
        let helper = "\t${Text/show text}" --"^" ++ text

        in  ./foldRemove.dhall [ helper, helper ++ prefix ] (helper ++ text)

let example0 = assert : stripPrefix "abc" "abcdef" ≡ "def"

let example1 = assert : stripPrefix "def" "abcdef" ≡ "abcdef"

let example2 = assert : stripPrefix "" "abc" ≡ "abc"

let example3 = assert : stripPrefix "abc" "" ≡ ""

let example4 = assert : stripPrefix "" "" ≡ ""

let example5 = assert : stripPrefix "abc" "abcabcdef" ≡ "abcdef"

in  stripPrefix
