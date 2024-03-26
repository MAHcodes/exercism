import gleam/string

fn do_reverse_acc(list: List(a), acc: List(a)) -> List(a) {
  case list {
    [item, ..rest] -> do_reverse_acc(rest, [item, ..acc])
    [] -> acc
  }
}

fn do_reverse(list: List(a)) -> List(a) {
  do_reverse_acc(list, [])
}

pub fn reverse(value: String) -> String {
  value
  |> string.to_graphemes
  |> do_reverse
  |> string.concat
}
