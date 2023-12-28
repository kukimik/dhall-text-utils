let doesNotContain =
      \(needle : Text) ->
      \(haystack : Text) ->
            ["x" , haystack ] === [Text/replace needle "x" needle , Text/replace needle "" haystack ] -- the first element "x" of the list is needed because "" is contained in every text value, so we need to guarantee that needle is not empty

let example0 = assert : doesNotContain "123" "abc"

let example1 = assert : doesNotContain "x" ""

in doesNotContain            