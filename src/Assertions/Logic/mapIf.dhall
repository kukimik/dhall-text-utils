let TextBool = ./TextBool.dhall

let not = ./not.dhall

let mapIf =
      λ(condition : Text → TextBool) →
      λ(ifTrue : Text → Text) →
      λ(ifFalse : Text → Text) →
      λ(input : Text) →
        let evaluatedCondition = condition input

        in      Text/replace "x" (ifTrue input) evaluatedCondition.vtb
            ++  Text/replace "x" (ifFalse input) (not evaluatedCondition).vtb

in  mapIf
