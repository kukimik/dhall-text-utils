# dhall-text-utils

Utilities for validation and modification of `Text` values in the [Dhall](https://dhall-lang.org/) configuration language. Not recommended for use in production.

## What is this all about? 

The `Text` type in Dhall is opaque by design. It is impossible to inspect the value of a `Text` expression during evaluation. (One may, however, test `Text` values for equality during the type-checking phase, e.g. `assert : "abc" === "ab" ++ "c"`.) The `Text`-related language bulit-ins are also scarce: `Text/show`, `Text/replace` and the concatenation operator `++`.

This library contains a number of functions, implemented using the above toolset and a dose of creativity, that allow one to manipulate `Text` values based on their content:

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
values using the limited `Text` toolbox of Dhall. It was great fun!

The following discussions gave me some inspiration:

* https://github.com/dhall-lang/dhall-lang/issues/1035
* https://github.com/dhall-lang/dhall-lang/pull/669#issuecomment-515748801
* https://discourse.dhall-lang.org/t/text-manipulation-functions/176/55

Note that some of the possibilities that the library gives are strongly against the philosophy of Dhall (and good programming
practices), e.g. it allows to string-encode some of the business logic instead of keeping it at the type level.

While writing the library I mostly thought about extending it with new capabilities, keeping it correct, and making its use
simple. Performance was never a goal.

For this reason I do not advise to use `dhall-text-utils` in production. The performance is probably very poor (it was never
benchmarked). While some improvements are definitely possible, the whole idea behind the library seems doomed to
have bad performance. The library was also not tested thoroughly.

However, the library demonstrates that Dhall already has some text validation capabilities. This may be an argument to 
have them included, in some form, in a future version of the language standard as built-in features.

## How it works?

The library makes use of several properties of the `Text` related operations. Some of them are inherent to these operations
(e.g. the empty string being the neutral element of concatenation), some are more incidental (e.g. the escaping rules used
by `Text/show`).

While the `Text` type is opaque in Dhall, i.e. we can not inspect `Text` values and get, say, a `Bool` or a `Natural` result
depending on their content. However, `Text` values may be modified. And the result of the `Text/replace : Text -> Text -> Text -> Text` function
depends on the content of its arguments in an interesting way. In particular `Text/replace t s t` equals `s` for any non-empty string `t`, but it
equals `""` if `t === ""`. Using this fact we can, given a `Text` value `t`, obtain some fixed string, let it be `"x"`, if `t` is 
non-empty, and obtain `""` otherwise:

```dhall
-- returns "" if t is empty and "x" if t is not empty
let nonempty2x = \(t : Text) -> Text/replace t "x" t
```

It also happens that `""` is the neutral element of the `Text` concatenation monoid (i.e. appending or prepending `""` does not change
a string), which allows us tu "detect" the empty string in a similar fashion:

```dhall
-- returns "" if t is not empty and "x" if t is empty
let empty2x = \(t : Text) -> Text/replace "xx" "" ("x" ++ Text/replace t "x" t)
```

Now it is easy to write a function that accepts three arguments and returns the second argument if the first argument is the empty string and
returns the third argument otherwise:

```dhall
let ifEmptyThenElse = 
    \(t : Text) -> \(whenEmpty : Text) -> \(whenNotEmpty : Text) ->
        (Text/replace "x" whenEmpty (empty2x t))
        ++
        (Text/replace "x" whenNotEmpty (nonempty2x t))
```

If we are able to implement a function (let's call it a "predicate") `hasPropertyP : Text -> Text` that converts a `Text` value `t` either to `"x"` or to `""`, depending on `t` having or not having some property `P`, then we may use `ifEmptyThenElse` to construct a function `ifHasPropertyPThenElse : Text -> Text -> Text` which returns either the second argument if the first argument has property `P`, and the third argument otherwise. Moreover, we can use `hasPropertyP` to validate function arguments at the type-checking level:

```dhall
let f : forall ( t : Text ) -> ("x" === hasPropertyP t) -> SomeType =
    \(t : Text) -> \(assert : ("x" === hasPropertyP t)) -> [...]
```

or to write `assert`-based tests:

```dhall
let test = assert : "x" === hasPropertyP someVariable
```

It turns out such "predicates" exist for many properties. For example, to check whether `t` is equal to some given string, we can use:

```dhall
let equals = \(s : Text) -> \(t : Text) ->
    empty2x (Text/replace s "" t ++ Text/replace t "" s)
```

See [`./src/Predicates`](./src/Predicates) for the "predicates" that the library provides.

Now, if we assign names to `"x"` and `""`:

```dhall
let true : Text = "x"
let false : Text = ""
```

we can implement Boolean operators:

```dhall
let not : Text -> Text = empty2x
let or : Text -> Text -> Text = \(t1 : Text) -> \(t2 : Text) -> nonempty2x (t1 ++ t2) 
let and : Text -> Text -> Text = \(t1 : Text) -> \(t2 : Text) -> not (or (not t1) (not t2))
```

that work as expected when their input is either `""` or `"x"`.

The `dhall-text-utils` library wraps `true` and `false` in a record type (named `TextBool`, see [`./src/Logic`](./src/Logic)) and adds some sugar here and there, but this is the basic idea.

One other notable trick that is used in the [`stripPrefix`](./src/Transofrmations/stripPrefix.dhall) and [`stripSuffix`](./src/Transofrmations/stripSuffix.dhall) functions (and in the [histogram example](./examples/histogram.dhall)) is based on the fact that the output of `Text/show` will never contain certain substrings
(e.g. three consecutive quotation marks) or characters (e.g. a tab or a newline, which are converted to `\t` and `\n`). The details are left to the interested
reader.

## How is the library structured?

The library consists of several interrelated sub-packages:

* `Logic`
* `Predicates`
* `CharacterClasses`
* `Transformations`

Here we describe the contents of these packages. Studying the examples provided in this README and in the [`./examples`](./examples) directory should
be enough to start working with the library. 

### `Logic`

Contains the definition of the `Logic.TextBool` type, which is used to represent "true" and "false" encoded as `Text` wrapped in a record. Values of the type `Logic.TextBool` should never be constructed by hand. The details of the implementation of this type can change without notice and this is not
considered a breaking change. The main source of `Logic.TextBool` values are the functions living in the `Predicates` package. However, the functions `Logic.true` and `Logic.false` can be used to create `Logic.TextBool` "literals".

The basic Boolean operations are provided by `Logic.not`, `Logic.or`, `Logic.and` and `Logic.xor`. An `if`-like conditional is given in `Logic.ifThenElse`.

The package also contains some sugar used for assertions and dependent types: `Logic.isTrue`, `Logic.isFalse` can be used instead of `=== Logic.true`
or `=== Logic.false`. For example, instead of writing `Predicates.isEmpty x === Logic.true` we can write `Logic.isTrue (Predicates.isEmpty x)`. This
is mostly a matter of style. There exists another helper `Logic.QED`, that provides a "proof" for dependently typed functions:

```dhall
let f : forall (t : Text) -> Logic.isFalse (Predicates.isEmpty t) -> Text =
      \(t : Text) -> \(_ : Logic.isFalse (Predicates.isEmpty t)) -> [...]

in f "abc" Logic.QED
```

The functions `Logic.any` and `Logic.all` can be used to map predicates over a list and aggregate the result using either alternative or conjunction.

The package also contains a number of less notable functions.

### `CharacterClasses`

We defina a *character class* to be a list of `Text` values, each consisting of a single codepoint. For example `["a","b","3"]` and `[] : List Text` are character classes, but `["a","bc"]` is not.

The package contains definitions of several common character classes (e.g. the list of all ASCII characters, the list of ASCII digits, the list of Unicode control characters).

Note that if a function in the library accepts a `List Text` value that is expected to be a charcater class, then it should be a character class. **This is not
controlled at the type level and may lead to errors!** One should pay special attention to [Unicode characters consisting of several codepoints](https://tonsky.me/blog/unicode/#why-is-a----).

### `Predicates`

By a *predicate*, in the context of this library, we understand a `TextBool`-valued function. The package contains a number of predicates related to various properties of `Text` values, e.g. `Predicates.isEmpty : Text -> TextBool`, `Predicates.hasPrefix : Text -> Text -> TextBool`, `Predicates.containsOneOf : List Text -> Text -> Text`.

Some of these have versions with arguments flipped, e.g. `Predicates.contains` and `Predicates.isContainedIn`, or `Predicates.hasSuffix` and `Predicates.isSuffixOf`. Some may be easily constructed using the others and the functions from the `Logic` package (e.g. `Predicates.containsOneOf` is implemented using `Logic.any` and `Predicates.isContainedIn`). I do not strive for minimality. There is at present no rule which of these derived predicates are included in the library, and which are not. One exception is that I do not want to include negations of existsing predicates. For example:

```dhall
let isNotEmpty : Text -> TextBool = \(t : Text) -> Logic.not (Predicates.isEmpty t)
```

is not going to be included in the `Predicates` package.

Some of the predicates (e.g. `Predicates.consistsOf` or `Predicates.hasLengthUsing`) accept an argument that is required to be a character class (see the section above). **This is not checked at the type level!**

There are a few dependently typed predicates: `Predicates.hasLengthAtLeastUsing`, `Predicates.hasLengthAtMostUsing`, `Predicates.hasLengthUsing`. These functions use the fact that a given string consists entirely of codepoints belonging to a given character class. To use these predicates you have to guarantee, at the type-checking level, that this property holds. So, for example:

```dhall
Predicates.hasLengthUsing 5 CharacterClasses.ASCII "abcde" Logic.QED === Logic.true
```

but

```dhall
Predicates.hasLengthUsing 5 CharacterClasses.ASCII "ąbćdę" Logic.QED
```

will fail.

If you need to use a non-dependently typed version of these functions, then you may either try to use `Predicates.hasSubstringOfLengthAtLeastConsistingOf`. Or, when you are sure that your `Text` values consist only of character belonging to a certain class, create your own versions of these predicates, by copying the source and getting rid of the last argument.

### `Transformations`

The package contains a miscellany of functions that may be useful when manipulating `Text` values, like `Transformations.stripPrefix`, `Transformations.stripSuffix` or `Transformations.applyAll`, which consecutively applies a list of `Text -> Text` functions to a given `Text` value.
