let notEmpty  = \(t : Text) -> (./helpers/nonempty2x.dhall t === "x")

let example0 = assert : notEmpty "abc"

in notEmpty