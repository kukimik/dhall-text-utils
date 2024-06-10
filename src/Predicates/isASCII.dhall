{-|
Returns `false` if its argument contains any non-ASCII characters.
Returns `true` otherwise.
-}
let isTrue =
        missing
          sha256:16fc04e94ba9463ad527f6e83982c8d9c6f674046e1797d93de777847c837339
      ? ../Logic/isTrue.dhall

let isFalse =
        missing
          sha256:f6ee161dbe69940a3c09dd60f5946cb5fe6e216d5064811116bd87193d06b49d
      ? ../Logic/isFalse.dhall

let consistsOf =
        missing
          sha256:2cf5d7ed4f27a88ed8f795c9b95c61f769dc9efec9beb717fb8b02f8623c5cad
      ? ./consistsOf.dhall

let ASCII =
        missing
          sha256:a2f5fdd4ccef40ef2bc9acab701b310831f84b94ca9859294a0304598953b74c
      ? ../CharacterClasses/ASCII.dhall

let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ../Logic/TextBool.dhall

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
