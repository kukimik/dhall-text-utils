let or = ../Logic/or.dhall
let not = ../Logic/not.dhall
let isEmpty = ./isEmpty.dhall

let equals = ./equals.dhall

let stripSuffix = ../Transformations/stripPrefix.dhall

let hasSuffix =
      λ(suffix : Text) →
      λ(text : Text) →
        or [ isEmpty suffix, not (equals text (stripSuffix suffix text)) ]

in  hasSuffix
