{-|
Returns `false` if `text` contains any non-ASCII characters.
Returns `true` otherwise.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let consistsOf = ./consistsOf.dhall

let ASCII = ../CharacterClasses/ASCII.dhall

let TextBool = ../Logic/TextBool.dhall

let isASCII
    : forall (text : Text) -> TextBool
    = consistsOf ASCII

let example0 =
        assert
      : isTrue
          ( isASCII
              ''
              Have a nice day!
              ''
          )

let example1 = assert : isTrue (isASCII "")

let example2 = assert : isFalse (isASCII "Να εχεις μια ωραια μερα!")

in  isASCII
