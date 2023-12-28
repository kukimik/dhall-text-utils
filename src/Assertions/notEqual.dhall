let notEqual = \(t1 : Text) -> \(t2 : Text) -> ./notEmpty.dhall (./helpers/mutualRemove.dhall t1 t2)

let example0 = assert : notEqual "abc" "def"

let example1 = assert : notEqual "" "def"

let example2 = assert : notEqual "abc" ""

in notEqual
