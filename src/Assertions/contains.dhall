let not = ../Logic/not.dhall
let or = ../Logic/or.dhall
let isTrue = ../Logic/isTrue.dhall
let isFalse = ../Logic/isFalse.dhall
let equals = ./equals.dhall
let isEmpty = ./isEmpty.dhall

let contains =
      λ(needle : Text) →
      λ(haystack : Text) →
        or
          [ not (equals haystack (Text/replace needle "" haystack))
          , isEmpty needle
          ]

let example0 = assert : isTrue (contains "a" "abc")

let example1 = assert : isTrue (contains "" "x")

let example2 = assert : isTrue (contains "x" "x")

let example3 = assert : isTrue (contains "" "")

in  contains
