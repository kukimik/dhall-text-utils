let isEmpty = ./isEmpty.dhall
let foldRemove = ../Transformations/foldRemove.dhall
let consistsOf = \(characters : List Text) -> \(text : Text) -> isEmpty (foldRemove characters text)
in consistsOf
