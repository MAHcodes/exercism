import gleam/string

fn is_question(s: String) -> Bool {
  s
  |> string.trim_right
  |> string.ends_with("?")
}

fn is_uppercase(s: String) -> Bool {
  s != string.lowercase(s) && s == string.uppercase(s)
}

fn is_silence(s: String) -> Bool {
  s
  |> string.trim
  |> string.is_empty
}

fn is_uppercase_question(s: String) -> Bool {
  is_question(s) && is_uppercase(s)
}

pub fn hey(remark: String) -> String {
  case
    is_silence(remark),
    is_uppercase_question(remark),
    is_question(remark),
    is_uppercase(remark)
  {
    True, _, _, _ -> "Fine. Be that way!"
    _, True, _, _ -> "Calm down, I know what I'm doing!"
    _, _, True, _ -> "Sure."
    _, _, _, True -> "Whoa, chill out!"
    _, _, _, _ -> "Whatever."
  }
}
