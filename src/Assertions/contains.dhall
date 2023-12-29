let contains =
      \(needle : Text) ->
      \(haystack : Text) ->
            ./notEqual.dhall haystack ((./helpers/empty2x.dhall needle) ++ (Text/replace needle "" haystack))

let example0 = assert : contains "a" "abc"

let example1 = assert : contains "" "x"

let example2 = assert : contains "x" "x"

let example3 = assert : contains "" ""

in contains