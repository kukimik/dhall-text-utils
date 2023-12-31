let doesNotHaveSuffix = 
      \(suffix : Text) ->
      \(text : Text) ->
            { _1 = "x" , _2 = text } === { _1 = ./helpers/nonempty2x.dhall suffix , _2 = ../Transformations/stripSuffix suffix text }
in doesNotHaveSuffix        
