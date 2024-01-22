let or = ../Logic/or.dhall

let isEmpty = ./isEmpty.dhall

let equals = ./equals.dhall

let stripPrefix = ../Transformations/stripPrefix.dhall

let hasPrefix =
      λ(prefix : Text) →
      λ(text : Text) →
        or [ isEmpty prefix, not (equals text (stripPrefix prefix text)) ]

in  hasPrefix
