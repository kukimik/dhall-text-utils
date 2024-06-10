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

        in  (   missing
                  sha256:111988c88a178a1a665816d1b494701138eb4fb22c6d26e9bf6443c63e08c44e
              ? ./foldRemove.dhall
            )
              [ helper, suffix ++ helper ]
              (text ++ helper)

let example0 = assert : stripSuffix "abc" "abcdef" ≡ "abcdef"

let example1 = assert : stripSuffix "def" "abcdef" ≡ "abc"

let example2 = assert : stripSuffix "" "abc" ≡ "abc"

let example3 = assert : stripSuffix "abc" "" ≡ ""

let example4 = assert : stripSuffix "" "" ≡ ""

let example5 = assert : stripSuffix "abc" "defabcabc" ≡ "defabc"

in  stripSuffix
