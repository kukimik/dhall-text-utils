let true = ./Logic/true.dhall
let false = ./Logic/false.dhall
let isEmpty = ./isEmpty.dhall
let equals = \(t1 : Text) -> \(t2 : Text) -> ./isEmpty.dhall (./helpers/mutualRemove.dhall t1 t2)

let example0 = assert : equals "abc" "def" === false

let example1 = assert : equals "" "def" === false

let example2 = assert : equals "abc" "" === false

let example3 = assert : equals "ABC" "ABC" === true

let example4 = assert : equals "" "" === true

in equals
`