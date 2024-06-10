{-|
A helper that can be used instead of directly writing `assert : Logic.true === Logic.true`.
Designed to be used together with [`isTrue`](./isTrue.dhall.html) and [`isFalse`](./isFalse.dhall.html).

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
let true =
        missing
          sha256:098e2a4f266678afc95037a722ff69fa1c4d98c89928da1dc1b2dddb5d68a9a7
      ? ./true.dhall

let QED
    : true ≡ true
    = assert : true ≡ true

in  QED
