{-|
List of all ASCII characters that are letters.
-}
let ASCIIlower =
        missing
          sha256:7b31dee4f8420bfdaccd077c6337e01bbe7571203d37eb1b0cf9564a13ea67bb
      ? ./ASCIIlower.dhall

let ASCIIupper =
        missing
          sha256:cd0d0c4a65413bb8610ffa9429a34a3d1155cd0b746602d27f4f74d7a705f6df
      ? ./ASCIIupper.dhall

let ASCIIalpha = ASCIIupper # ASCIIlower

in  ASCIIalpha
