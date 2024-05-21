{-|
List of all ASCII characters that are letters.
-}
let ASCIIlower = ./ASCIIlower.dhall

let ASCIIupper = ./ASCIIupper.dhall

let ASCIIalpha = ASCIIupper # ASCIIlower

in  ASCIIalpha
