let isEmpty = ./isEmpty.dhall
let foldRemove = ../Transformations/foldRemove.dhall
let ASCII = ../CharacterClasses/ASCII.dhall
let isASCII = \(t : Text) -> isEmpty (foldRemove ASCII t)
in isASCII
