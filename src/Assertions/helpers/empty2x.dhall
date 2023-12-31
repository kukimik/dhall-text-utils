-- if t === "" it outputs "x"
-- otherwise it outputs ""
\(t : Text) -> Text/replace "xx" "" ("x" ++ Text/replace t "x" t)