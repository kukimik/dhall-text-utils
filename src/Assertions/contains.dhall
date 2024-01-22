let or = ../Logic/or.dhall

let contains =
      λ(needle : Text) →
      λ(haystack : Text) →
        or
          [ ./notEqual.dhall haystack (Text/replace needle "" haystack)
          , ./empty.dhall needle
          ]

let example0 = assert : contains "a" "abc"

let example1 = assert : contains "" "x"

let example2 = assert : contains "x" "x"

let example3 = assert : contains "" ""

in  contains
