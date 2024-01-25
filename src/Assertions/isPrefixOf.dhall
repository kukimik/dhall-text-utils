let hasPrefix = ./hasPrefix.dhall
let isPrefixOf = \(text : Text) -> \(prefix : Text) -> hasPrefix prefix text
in isPrefixOf
