-- if t === "" it outputs ""
-- otherwise it outputs "x"
let nonempty2x = λ(t : Text) → Text/replace t "x" t

let Prelude = ../Prelude.dhall

let TextBool = ./TextBool.dhall

let getVtb = λ(t : TextBool) → t.vtb

let or
    : List TextBool → TextBool
    = λ(vs : List TextBool) →
        { vtb = nonempty2x (Prelude.Text.concatMap TextBool getVtb vs) }

in  or
