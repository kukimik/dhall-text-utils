{-
Given a list of `TextBool` values returns `true` if at least one
element of the list is `true` and returns `false` otherwise.
-}
-- if t === "" it outputs ""
-- otherwise it outputs "x"
let nonempty2x = λ(t : Text) → Text/replace t "x" t

let Prelude = ../Prelude.dhall

let TextBool = ./TextBool.dhall

let getVtb = λ(t : TextBool) → t.`80b81b0c0bbf55ebb04bdadd9c70094a`

let true = ./true.dhall

let false = ./false.dhall

let or
    : List TextBool → TextBool
    = λ(vs : List TextBool) →
        { `80b81b0c0bbf55ebb04bdadd9c70094a` = nonempty2x (Prelude.Text.concatMap TextBool getVtb vs) }

let example0 = true ≡ or [ false, true, true ]

let example1 = false ≡ or [ false, false, false ]

let example2 = false ≡ or ([] : List TextBool)

in  or
