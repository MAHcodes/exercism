pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  case first {
    [item, ..rest] -> [item, ..append(rest, second)]
    [] -> second
  }
}

fn do_concat(lists: List(List(a)), acc: List(a)) -> List(a) {
  case lists {
    [list, ..rest] -> do_concat(rest, append(acc, list))
    [] -> acc
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  do_concat(lists, [])
}

fn do_filter(list: List(a), function: fn(a) -> Bool, acc: List(a)) -> List(a) {
  case list {
    [item, ..rest] ->
      case function(item) {
        True -> do_filter(rest, function, [item, ..acc])
        False -> do_filter(rest, function, acc)
      }
    [] -> reverse(acc)
  }
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  do_filter(list, function, [])
}

pub fn length(list: List(a)) -> Int {
  case list {
    [_, ..rest] -> 1 + length(rest)
    [] -> 0
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  case list {
    [item, ..rest] -> append([function(item)], map(rest, function))
    [] -> []
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [first, ..rest] -> foldl(rest, function(initial, first), function)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [first, ..rest] -> function(foldr(rest, initial, function), first)
  }
}

pub fn do_reverse(list: List(a), acc: List(a)) -> List(a) {
  case list {
    [item, ..rest] -> do_reverse(rest, [item, ..acc])
    [] -> acc
  }
}

pub fn reverse(list: List(a)) -> List(a) {
  do_reverse(list, [])
}
