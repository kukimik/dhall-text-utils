let doesNotContain =
      \(needle : Text) ->
      \(haystack : Text) ->
            { _1 = "x" , _2 = haystack } === { _1 = ./helpers/nonempty2x.dhall needle , _2 = Text/replace needle "" haystack }

let example0 = assert : doesNotContain "123" "abc"

let example1 = assert : doesNotContain "x" ""

in doesNotContain            