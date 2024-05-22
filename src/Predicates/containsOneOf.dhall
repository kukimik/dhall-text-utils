{-|
Returns `true` if `t` contains at least one of `ts` as a substring.
Returns `false` otherwise.
-}
let isTrue = ../Logic/isTrue.dhall

let isFalse = ../Logic/isFalse.dhall

let any = ../Logic/any.dhall

let TextBool = ../Logic/TextBool.dhall

let isContainedIn = ./isContainedIn.dhall

let containsOneOf
    : ∀(ts : List Text) → ∀(t : Text) → TextBool
    = λ(ts : List Text) → λ(t : Text) → any Text (isContainedIn t) ts

let example0 =
        assert
      : isTrue (containsOneOf [ "John", "Jack", "Alice" ] "Bob and Alice")

let example1 = assert : isTrue (containsOneOf [ "a", "b", "c" ] "abc")

let example2 = assert : isTrue (containsOneOf [ "" ] "")

let example3 =
        assert
      : isFalse
          (containsOneOf [ "Andrew", "Bob", "Celine" ] "Dave, Ed and Frank")

in  containsOneOf
