let allNonEmpty = \(ts : List Text) -> concatMap??? (\(t : Text) -> replace t "x") ts === Text.replicate (List/length ts) "x"