{-|
The definition of the `TextBool` type, used to encode the Boolean values True/False as text,
and some related functions and helpers, including:

* the Boolean operators: `and`, `or`, `xor`, `not`;
* a conditionalL `ifThenElse`;
* utilities for mapping a predicate over a set of values: `any`, `all`, `exactlyOne`;
* helper functions for working with dependent types: `isTrue`, `isFalse`, `QED`.
-}
{ all = ./all.dhall
, and = ./and.dhall
, any = ./any.dhall
, bool2TextBool = ./bool2TextBool.dhall
, exactlyOne = ./exactlyOne.dhall
, false = ./false.dhall
, ifThenElse = ./ifThenElse.dhall
, isFalse = ./isFalse.dhall
, isTrue = ./isTrue.dhall
, not = ./not.dhall
, or = ./or.dhall
, QED = ./QED.dhall
, TextBool = ./TextBool.dhall
, true = ./true.dhall
, xor = ./xor.dhall
}
