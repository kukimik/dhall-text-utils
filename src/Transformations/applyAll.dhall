let applyAll : List (Text -> Text) -> Text -> Text =
  \(fs : List (Text -> Text)) -> \(t: Text) ->
	List/fold (Text -> Text) fs Text (\(f : Text -> Text) -> \(s : Text) -> f s) t
in applyAll