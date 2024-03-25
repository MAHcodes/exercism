fn do_reverse(list: List(t), acc: List(t)) -> List(t) {
  case list {
    [] -> acc
    [item, ..rest] -> do_reverse(rest, [item, ..acc])
  }
}

fn reverse(list: List(t)) -> List(t) {
  do_reverse(list, [])
}

fn do_keep(list: List(t), predicate: fn(t) -> Bool, acc: List(t)) -> List(t) {
  case list {
    [item, ..rest] ->
      case predicate(item) {
        True -> do_keep(rest, predicate, [item, ..acc])
        False -> do_keep(rest, predicate, acc)
      }
    [] -> reverse(acc)
  }
}

fn do_discard(list: List(t), predicate: fn(t) -> Bool, acc: List(t)) -> List(t) {
  case list {
    [item, ..rest] ->
      case predicate(item) {
        True -> do_discard(rest, predicate, acc)
        False -> do_discard(rest, predicate, [item, ..acc])
      }
    [] -> reverse(acc)
  }
}

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_keep(list, predicate, [])
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_discard(list, predicate, [])
}
