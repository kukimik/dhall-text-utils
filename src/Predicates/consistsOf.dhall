{-|
The first argument should be a a character class.

Under this assumption the function returns `true` if the second argument
consists entirely of characters belonging to first argument, and returns `false`
otherwise.

Behaviour is undefined if the firsr argument is not a character class.
-}
let isTrue =
        missing
          sha256:16fc04e94ba9463ad527f6e83982c8d9c6f674046e1797d93de777847c837339
      ? ../Logic/isTrue.dhall

let isFalse =
        missing
          sha256:f6ee161dbe69940a3c09dd60f5946cb5fe6e216d5064811116bd87193d06b49d
      ? ../Logic/isFalse.dhall

let isEmpty =
        missing
          sha256:05f098b4410b29a005fe12a41c0977ea199c45a55cf8bc0289b200cb278afe4c
      ? ./isEmpty.dhall

let foldRemove =
        missing
          sha256:111988c88a178a1a665816d1b494701138eb4fb22c6d26e9bf6443c63e08c44e
      ? ../Transformations/foldRemove.dhall

let consistsOf =
      λ(characters : List Text) →
      λ(text : Text) →
        isEmpty (foldRemove characters text)

let example0 =
      assert : isTrue (consistsOf [ ".", "-", " " ] "-.. .... .- .-.. .-..")

let example1 = assert : isTrue (consistsOf ([] : List Text) "")

let example2 = assert : isTrue (consistsOf [ "A", "B", "C" ] "AAA")

let example3 = assert : isFalse (consistsOf [ "A", "B" ] "ABC")

in  consistsOf
