{-|
A helper function that can be used instead of directly writing `=== Logic.true`.
Designed to be used together with [`QED`](./QED.dhall.html).

This is mostly a matter of style.

## Example

We can write:

```
let f : forall (t : Text) -> Logic.isTrue (Predicates.isASCII t) -> Text =
      \(t : Text) -> \(_ : Logic.isTrue (Predicates.isASCII t)) -> [...]

in f "abc" Logic.QED
```

instead of:

```
let f : forall (t : Text) -> Logic.true === Predicates.isASCII t -> Text =
      \(t : Text) -> \(_ : Logic.true === Predicates.isASCII t) -> [...]

in f "abc" (assert : Logic.true === Logic.true)
```
-}
let TextBool = ./TextBool.dhall

let true = ./true.dhall

let isTrue
    : ∀(v : TextBool) → Type
    = λ(v : TextBool) → true ≡ v

in  isTrue
