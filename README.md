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
let T = ./src/Transformations/package.dhall

let hexDigits = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]

let  hex2binary: ∀(hex : Text) ->  (L.isTrue (P.consistsOf hexDigits hex)) -> Text =
    \(hex : Text) -> \(_ : L.isTrue (P.consistsOf hexDigits hex)) ->
        T.applyAll
            [Text/replace "F" "1111"
            ,Text/replace "E" "1110"
            ,Text/replace "D" "1101"
            ,Text/replace "C" "1100"
            ,Text/replace "B" "1011"
            ,Text/replace "A" "1010"
            ,Text/replace "9" "1001"
            ,Text/replace "8" "1000"
            ,Text/replace "7" "0111"
            ,Text/replace "6" "0110"
            ,Text/replace "5" "0101"
            ,Text/replace "4" "0100"
            ,Text/replace "3" "0011"
            ,Text/replace "2" "0010"
            ,Text/replace "1" "0001"
            ,Text/replace "0" "0000"
            ]
            hex

in hex2binary "BADF00D" L.QED
```

And some parser-like capabilities are in the making!

More examples can be found in the [`examples/`](./examples/) directory.

## Some comments

The library was created out of curiosity. I wanted to see how far I can get with validation and manipulation of `Text`
values using the limited `Text` toolbox of Dhall. It was great fun! (Well, except for writing the docs.)

While writing it I mostly thought about extending the library with new capabilities, making the API simple and keeping
the code readable. Performance was never a goal.

The following discussions gave me some inspiration:

* https://github.com/dhall-lang/dhall-lang/issues/1035
* https://github.com/dhall-lang/dhall-lang/pull/669#issuecomment-515748801

Note that some of the possibilities that the library gives are strongly against the philosophy of Dhall (and good programming
practices), e.g. it allows to string-encode some of the business logic instead of keeping it at the type level.

I do not advise to use `dhall-text-utils` in production. The performance is probably very poor (it was never benchmarked)
and while some improvements are definitely possible, the whole idea is just a big workaround and showcase. The library
was also not test thoroughly.

Perhaps, once it is demonstrated that Dhall already allows for these operations, some of them may be included in a future
language standard?

## Implementation details

* sketch how it works
* TextBool - may change
