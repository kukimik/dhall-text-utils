let doesNotHavePrefix = 
      \(prefix : Text) ->
      \(text : Text) ->
            { _1 = "x" , _2 = text } === { _1 = ./helpers/nonempty2x.dhall prefix , _2 = ../Transformations/stripPrefix prefix text }
in doesNotHavePrefix        
