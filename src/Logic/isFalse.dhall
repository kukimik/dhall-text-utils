{-|
A helper function that can be used instead of directly writing `=== Logic.false`.
Designed to be used together with [`QED`](./QED.dhall.html).

This is mostly a matter of style.

## Example

We can write:

```
let f : forall (t : Text) -> Logic.isFalse (Predicates.isEmpty t) -> Text =
      \(t : Text) -> \(_ : Logic.isFalse (Predicates.isEmpty t)) -> [...]

in f "abc" Logic.QED
```

instead of:

```
let f : forall (t : Text) -> Logic.false === Predicates.isEmpty t -> Text =
      \(t : Text) -> \(_ : Logic.false === Predicates.isEmpty t) -> [...]

in f "abc" (assert : Logic.false === Logic.false)
```
-}
let TextBool = ./TextBool.dhall

let true = ./true.dhall

let not = ./not.dhall

let isFalse
    : ∀(v : TextBool) → Type
    = λ(v : TextBool) → true ≡ not v

in  isFalse
