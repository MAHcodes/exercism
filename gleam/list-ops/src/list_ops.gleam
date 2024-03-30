pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  case second {
    [item, ..rest] -> [item, ..append(first, rest)]
    [] -> []
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  case lists {
    [list, ..rest] -> append(list, concat(rest))
    [] -> []
  }
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  case list {
    [item, ..rest] ->
      case function(item) {
        True -> filter(append([item], rest), function)
        False -> filter(rest, function)
      }
    [] -> []
  }
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
    [item, ..rest] -> foldl(rest, function(initial, item), function)
    [] -> initial
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case reverse(list) {
    [item, ..rest] -> function(foldr(rest, initial, function), item)
    [] -> initial
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
