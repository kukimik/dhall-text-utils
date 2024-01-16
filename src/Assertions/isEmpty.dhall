let TextBool = ./Logic/TextBool
let empty2x = ./helpers/empty2x.dhall
let true = ./Logic/true.dhall
let false = ./Logic/false.dhall
let isEmpty : \(t : Text) -> TextBool = \(t : Text) -> {vtb = empty2x t}

let example0 = assert : isEmpty "abc" === false
let example1 = assert : isEmpty "" === true

in isEmpty