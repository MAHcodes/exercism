import gleam/list

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

fn length(list: List(String)) -> Int {
  list.length(list)
}

pub fn count_languages(languages: List(String)) -> Int {
  length(languages)
}

fn reverse(list: List(a)) -> List(a) {
  list.reverse(list)
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  reverse(languages)
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    ["Gleam", ..] -> True
    [_, "Gleam"] -> True
    [_, "Gleam", _] -> True
    _ -> False
  }
}
