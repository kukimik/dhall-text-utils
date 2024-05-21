{-|
List of all ASCII alphanumeric characters.
-}
let ASCIIalpha = ./ASCIIalpha.dhall

let ASCIIdigit = ./ASCIIdigit.dhall

let ASCIIalnum = ASCIIdigit # ASCIIalpha

in  ASCIIalnum
