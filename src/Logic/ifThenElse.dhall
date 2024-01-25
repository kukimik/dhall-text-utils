let TextBool = ./TextBool.dhall

let not = ./not.dhall

let ifThenElse =
      λ(condition : TextBool) →
      λ(valueIfTrue : Text) →
      λ(valueIfFalse : Text) →
        Text/replace "x" valueIfTrue condition.vtb
        ++
        Text/replace "x" valueIfFalse (not condition).vtb

in  ifThenElse
