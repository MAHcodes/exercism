import gleam/list
import gleam/regex

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regex.from_string("[DEBUG]|[INFO]|[WARNING]|[ERROR]")
  regex.check(re, line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("^<[~*=-]+$>")
  list.map(regex.scan(re, line), fn(match) { match.content })
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) = regex.from_string("[User] {1,3}(\\w+)")
}
