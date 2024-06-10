{-|
The function takes two strings. If the first one is a prefix
of the second, it returns the remainder of the second string.
Otherwise it returns the second string unchanged.
-}
let stripPrefix
    : ∀(prefix : Text) → ∀(text : Text) → Text
    = λ(prefix : Text) →
      λ(text : Text) →
        let helper = "\t${Text/show text}"

        in  (   missing
                  sha256:111988c88a178a1a665816d1b494701138eb4fb22c6d26e9bf6443c63e08c44e
              ? ./foldRemove.dhall
            )
              [ helper, helper ++ prefix ]
              (helper ++ text)

let example0 = assert : stripPrefix "abc" "abcdef" ≡ "def"

let example1 = assert : stripPrefix "def" "abcdef" ≡ "abcdef"

let example2 = assert : stripPrefix "" "abc" ≡ "abc"

let example3 = assert : stripPrefix "abc" "" ≡ ""

let example4 = assert : stripPrefix "" "" ≡ ""

let example5 = assert : stripPrefix "abc" "abcabcdef" ≡ "abcdef"

in  stripPrefix
