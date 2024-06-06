{-|
If the first argument is `true`, returns the second argument.
If the first argument is `false`, returns the third argument.
-}
let TextBool = ./TextBool.dhall

let not = ./not.dhall

let true = ./true.dhall

let false = ./false.dhall

let ifThenElse =
      λ(condition : TextBool) →
      λ(valueIfTrue : Text) →
      λ(valueIfFalse : Text) →
            Text/replace
              "x"
              valueIfTrue
              condition.`80b81b0c0bbf55ebb04bdadd9c70094a`
        ++  Text/replace
              "x"
              valueIfFalse
              (not condition).`80b81b0c0bbf55ebb04bdadd9c70094a`

let example0 = "a" ≡ ifThenElse true "a" "b"

let example1 = "b" ≡ ifThenElse false "a" "b"

in  ifThenElse
