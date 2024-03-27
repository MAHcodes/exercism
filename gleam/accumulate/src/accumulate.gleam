pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [item, ..rest] -> [fun(item), ..accumulate(rest, fun)]
  }
}
