let isNotElementOf = \(t : Text) -> (ts : List Text) -> ./allNotEmpty.dhall (List.map ./helpers/mutualRemove.dhall t ts)

in isNotElementOf