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
let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ./TextBool.dhall

let true =
        missing
          sha256:098e2a4f266678afc95037a722ff69fa1c4d98c89928da1dc1b2dddb5d68a9a7
      ? ./true.dhall

let not =
        missing
          sha256:cb09ed1bcee1bd18e8bfba89a6fd7bb08657115940b322f98c86daa80e066bc8
      ? ./not.dhall

let isFalse
    : ∀(v : TextBool) → Type
    = λ(v : TextBool) → true ≡ not v

in  isFalse
