pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  case list {
    [item, ..rest] -> {
      case predicate(item) {
        True -> [item, ..keep(rest, predicate)]
        False -> keep(rest, predicate)
      }
    }
    [] -> []
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  case list {
    [item, ..rest] -> {
      case predicate(item) {
        True -> discard(rest, predicate)
        False -> [item, ..discard(rest, predicate)]
      }
    }
    [] -> []
  }
}
