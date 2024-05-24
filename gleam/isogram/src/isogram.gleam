import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  case
    phrase
    |> string.replace("-", "")
    |> string.replace(" ", "")
    |> string.lowercase
    |> string.pop_grapheme
  {
    Ok(p) ->
      case string.contains(p.1, p.0) {
        True -> False
        False -> is_isogram(p.1)
      }
    Error(_) -> True
  }
}
