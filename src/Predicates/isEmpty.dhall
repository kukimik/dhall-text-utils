{-|
Returns `true` if its argument is the empty string `""`.
Returns `false` otherwise.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let TextBool = ../Logic/TextBool.dhall

let empty2x = λ(t : Text) → Text/replace "xx" "" ("x" ++ Text/replace t "x" t)

let isEmpty
    : ∀(text : Text) → TextBool
    = λ(text : Text) → { `80b81b0c0bbf55ebb04bdadd9c70094a` = empty2x text }

let example0 = assert : isFalse (isEmpty "abc")

let example1 = assert : isTrue (isEmpty "")

in  isEmpty
