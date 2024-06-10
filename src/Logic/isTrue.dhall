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
let TextBool =
        missing
          sha256:fa222e9b894b0a1b05a91e78290abaad53a37d69f66ad3cdb4eb8ff99d2b05c4
      ? ./TextBool.dhall

let true =
        missing
          sha256:098e2a4f266678afc95037a722ff69fa1c4d98c89928da1dc1b2dddb5d68a9a7
      ? ./true.dhall

let isTrue
    : ∀(v : TextBool) → Type
    = λ(v : TextBool) → true ≡ v

in  isTrue
