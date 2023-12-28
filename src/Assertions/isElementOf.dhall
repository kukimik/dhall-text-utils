let isElementOf = \(t : Text) -> (ts : List Text) -> ./atLeastOneEmpty.dhall (List.map ./helpers/mutualRemove.dhall t ts)

in isElementOf
