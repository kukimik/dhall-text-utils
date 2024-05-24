# dhall-text-utils

Utilities for validation and modification of `Text` values in the [Dhall](https://dhall-lang.org/) configuration language.

The `Text` type in Dhall is opaque by design. It is impossible to inspect the value of a `Text` expression during evaluation. One may, however, test `Text` values for equality during the type-checking phase (e.g. `assert : "abc" === "ab" ++ "c"`). The `Text`-related language bulit-ins are also scarce: `Text/show`, `Text/replace` and the concatenation operator `++`. It turns out that using this limited toolset, and a dose of creativity, one can implement a number of functions that allow to manipulate `Text` values based on their content:

```dhall
let L = ./src/Logic/package.dhall
let P = ./src/Predicates/package.dhall

let f : Text -> Text =
    \t -> L.ifThenElse
            (L.any [P.hasPrefix "aaa", P.hasPrefix "bb", P.contains "c"])
            (t ++ " starts with 'aaa' or ends with 'bb' or contains 'c'!")
            (t ++ " is not very interesting")

in List/map (Text)
```

validate `Text` values at the type-checking phase:

```dhall
let L = ./src/Logic/package.dhall
let P = ./src/Predicates/package.dhall

let badWords = ["adults", "only", "really", "bad", "swear", "words"]

let rhyme = "As I went up the apple tree\nAll the apples fell on me.\nApple pudding, apple pie\nDid you ever tell a lie?"

let test = assert : L.isFalse (P.containsOneOf badWords rhyme)

in blogPost
```

or use dependent types to control function input:

```dhall
let L = ./src/Logic/package.dhall
let P = ./src/Predicates/package.dhall
let C = ./src/CharacterClasses/package.dhall

let  encircle: ∀(stringOfDigits : Text) ->  (L.isTrue (P.consistsOf C.ASCIIdigit stringOfDigits)) -> Text =
    \stringOfDigits -> \_proof ->
        Text/replace "0" "⓪"
        (Text/replace "1" "①"
        (Text/replace "2" "②"
        (Text/replace "3" "③"
        (Text/replace "4" "④"
        (Text/replace "5" "⑤"
        (Text/replace "6" "⑥"
        (Text/replace "7" "⑦"
        (Text/replace "8" "⑧"
        (Text/replace "9" "⑨" stringOfDigits)))))))))


in encircle "32167" L.QED
```

And some parser-like capabilities are in the making!

See the [`examples/`](./examples/) directory for some more involved applications.

## Intended audience

## Why

