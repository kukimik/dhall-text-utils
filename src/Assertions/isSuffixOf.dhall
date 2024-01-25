let hasSuffix = ./hasSuffix.dhall
let isSuffixOf = \(text : Text) -> \(suffix : Text) -> hasSuffix suffix text
in isSuffixOf
