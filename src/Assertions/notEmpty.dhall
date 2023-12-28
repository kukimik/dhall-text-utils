let notEmpty  = \(t : Text) -> (Text/replace t "x" t === "x")

let example0 = assert : notEmpty "abc"

in notEmpty