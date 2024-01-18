let any = ./Logic/any.dhall

let equals = ./equals.dhall

let isElementOf = λ(t : Text) → (ts : List Text) → any Text (equals t) ts

in  isElementOf
