{-|
Returns `true` if `t` is an element of `ts`.
Returns `false` otherwise.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let any = ../Logic/any.dhall

let equals = ./equals.dhall

let isElementOf = λ(t : Text) → λ(ts : List Text) → any Text (equals t)

let example0 = assert : isTrue (isElementOf "world" [ "Hello", "world", "!" ])

let example1 = assert : isFalse (isElementOf "cyan" [ "red", "green", "blue" ])

in  isElementOf
