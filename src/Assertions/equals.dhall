let true = ../Logic/true.dhall

let false = ../Logic/false.dhall

let isEmpty = ./isEmpty.dhall

let mutualRemove =
      λ(t1 : Text) →
      λ(t2 : Text) →
        (Text/replace t1 "" t2) ++ (Text/replace t2 "" t1)

let equals = λ(t1 : Text) → λ(t2 : Text) → isEmpty (mutualRemove t1 t2)

let example0 = assert : equals "abc" "def" ≡ false

let example1 = assert : equals "" "def" ≡ false

let example2 = assert : equals "abc" "" ≡ false

let example3 = assert : equals "ABC" "ABC" ≡ true

let example4 = assert : equals "" "" ≡ true

in  equals
