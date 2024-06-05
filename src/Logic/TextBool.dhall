{-|
A type that reperesents true and false values as text.

`TextBool` values **should not** be constructed or inspected
by hand, but only using library functions. The type should
be treated as a black box. The internal representation may
change without mention at any time in future versions of the
library.

The only two `TextBool` values that should be in use are
the `true` and `false` constants. Behaviour of functions
in this library is unspecifid for any other of the (infinitely
many) possible `TextBool` values.
-}
let TextBool = { `80b81b0c0bbf55ebb04bdadd9c70094a` : Text } in TextBool
