{-|
Returns `true` if `text` is the empty string `""`.
Returns `false` otherwise.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let TextBool = ../Logic/TextBool.dhall

let empty2x = λ(t : Text) → Text/replace "xx" "" ("x" ++ Text/replace t "x" t)

let isEmpty
    : ∀(text : Text) → TextBool
    = λ(text : Text) → { vtb = empty2x text }

let example0 = assert : isFalse (isEmpty "abc")

let example1 = assert : isTrue (isEmpty "")

in  isEmpty
