{-|
List of all ASCII alphanumeric characters.
-}
let ASCIIalpha =
        missing
          sha256:f35adaed6e9e6c5f66e45da598ec4a30537bad115ecc30815032e9146d45880a
      ? ./ASCIIalpha.dhall

let ASCIIdigit =
        missing
          sha256:84c30d4d8560fa06318b3bba33f5b48a5269a39ddd8ba804af57b2dd8dc47b6f
      ? ./ASCIIdigit.dhall

let ASCIIalnum = ASCIIdigit # ASCIIalpha

in  ASCIIalnum
