{-
Given a `condition` returns `valueIfTrue` if the `condition` evaluates
to `true` and returns `valueIfFalse` if the `condition evaluates to `false`.
-}
let TextBool = ./TextBool.dhall

let not = ./not.dhall

let true = ./true.dhall

let false = ./false.dhall

let ifThenElse =
      λ(condition : TextBool) →
      λ(valueIfTrue : Text) →
      λ(valueIfFalse : Text) →
            Text/replace "x" valueIfTrue condition.`80b81b0c0bbf55ebb04bdadd9c70094a`
        ++  Text/replace "x" valueIfFalse (not condition).`80b81b0c0bbf55ebb04bdadd9c70094a`

let example0 = "a" ≡ ifThenElse true "a" "b"

let example1 = "b" ≡ ifThenElse false "a" "b"

in  ifThenElse
