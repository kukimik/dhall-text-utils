let contains = ./contains.dhall
let TextBool = ../Logic/contains.dhall
let isContainedIn : (haystack : Text) -> (needle : Text) -> TextBool = \(haystack : Text) -> \(needle : Text) -> contains needle haystack
in isContainedIn
