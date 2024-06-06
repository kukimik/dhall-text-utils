{-|
[FizzBuzz](https://en.wikipedia.org/wiki/Fizz_buzz) implemented in Dhall using
`Text` transformations.
-}

let L = ../src/Logic/package.dhall

let T = ../src/Transformations/package.dhall

let P = ../src/Predicates/package.dhall

let Prelude = ../src/Prelude.dhall

let fizzBuzz
    : ∀(n : Natural) → Text
    = let divisibleBy5 = λ(t : Text) → L.any Text (P.isSuffixOf t) [ "0", "5" ]

      let divisibleBy3 =
            λ(t : Text) →
              let digitsReplacedByRemainders =
                    T.applyAll
                      [ Text/replace "0" ""
                      , Text/replace "1" "I"
                      , Text/replace "2" "II"
                      , Text/replace "3" ""
                      , Text/replace "4" "I"
                      , Text/replace "5" "II"
                      , Text/replace "6" ""
                      , Text/replace "7" "I"
                      , Text/replace "8" "II"
                      , Text/replace "9" ""
                      ]
                      t

              in  P.isEmpty (Text/replace "III" "" digitsReplacedByRemainders)

      let display =
            λ(t : Text) →
              let fizzOrBuzz =
                        L.ifThenElse (divisibleBy3 t) "Fizz" ""
                    ++  L.ifThenElse (divisibleBy5 t) "Buzz" ""

              in  L.ifThenElse (P.isEmpty fizzOrBuzz) t fizzOrBuzz

      in  λ(n : Natural) →
            Prelude.Text.concatMapSep
              ","
              Text
              display
              ( Prelude.List.generate
                  n
                  Text
                  (λ(m : Natural) → Natural/show (m + 1))
              )

in  fizzBuzz 100
