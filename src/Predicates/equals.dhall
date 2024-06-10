{-|
Returns `true` if both of its arguments are equal.
Returns `false` otherwise.
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

let mutualRemove =
      λ(t1 : Text) →
      λ(t2 : Text) →
        Text/replace t1 "" t2 ++ Text/replace t2 "" t1

let equals = λ(t1 : Text) → λ(t2 : Text) → isEmpty (mutualRemove t1 t2)

let example0 = assert : isFalse (equals "abc" "def")

let example1 = assert : isFalse (equals "" "def")

let example2 = assert : isFalse (equals "abc" "")

let example3 = assert : isTrue (equals "ABC" "ABC")

let example4 = assert : isTrue (equals "" "")

in  equals
