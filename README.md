# dhall-text-utils

Utilities for validation and modification of `Text` values in the [Dhall](https://dhall-lang.org/) configuration language.

The `Text` type in Dhall is opaque by design. It is impossible to inspect the value of a `Text` expression during evaluation. One may, however, test `Text` values for equality during the type-checking phase (e.g. `assert : "abc" === "ab" ++ "c"`). The `Text`-related language bulit-ins are also scarce: `Text/show`, `Text/replace` and the concatenation operator `++`. It turns out that using this limited toolset, and a dose of creativity, one can implement a number of functions that allow to manipulate `Text` values based on their content:

```dhall
let L = ./src/Logic/package.dhall
let P = ./src/Predicates/package.dhall
let Prelude = ./src/Prelude.dhall

let animals = ["aardvark", "hippo", "dog", "chimpanzee", "cat", "chickadee", "flapper", "manatee","aardwolf"]

let f : Text -> Text =
    \(t : Text)
        -> "${Text/show t} "
            ++
           L.ifThenElse
            (L.or [P.hasPrefix "aa" t, P.hasSuffix "ee" t, P.contains "pp" t])
            ("starts with \"aa\", or ends with \"ee\", or contains \"pp\"!")
            ("is not very interesting")

in  Prelude.Text.concatSep "\n"
        (Prelude.List.map Text Text f animals)
```

validate `Text` values at the type-checking phase:

```dhall
let L = ./src/Logic/package.dhall
let P = ./src/Predicates/package.dhall

let badWords = ["adults", "only", "really", "bad", "swear", "words"]

let rhyme =
    ''
    As I went up the apple tree
    All the apples fell on me.
    Apple pudding, apple pie
    Did you ever tell a lie?
    ''

let test = assert : L.isFalse (P.containsOneOf badWords rhyme)

in rhyme
```

or use dependent types to control allowed function input:

```dhall
let L = ./src/Logic/package.dhall
let P = ./src/Predicates/package.dhall

let hexDigits = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]

let  hex2binary: ∀(hex : Text) ->  (L.isTrue (P.consistsOf hexDigits hex)) -> Text =
    \(hex : Text) -> \(_ : L.isTrue (P.consistsOf hexDigits hex)) ->
         Text/replace "F" "1111"
        (Text/replace "E" "1110"
        (Text/replace "D" "1101"
        (Text/replace "C" "1100"
        (Text/replace "B" "1011"
        (Text/replace "A" "1010"
        (Text/replace "9" "1001"
        (Text/replace "8" "1000"
        (Text/replace "7" "0111"
        (Text/replace "6" "0110"
        (Text/replace "5" "0101"
        (Text/replace "4" "0100"
        (Text/replace "3" "0011"
        (Text/replace "2" "0010"
        (Text/replace "1" "0001"
        (Text/replace "0" "0000" hex )))))))))))))))

in hex2binary "BADF00D" L.QED
```

And some parser-like capabilities are in the making!

See the [`examples/`](./examples/) directory for some more involved applications.

## Intended audience

## Why

