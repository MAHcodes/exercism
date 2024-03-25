pub fn today(days: List(Int)) -> Int {
  case days {
    [day, ..] -> day
    [] -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [day, ..rest] -> [day + 1, ..rest]
    [] -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [0, ..] -> True
    [_, ..rest] -> has_day_without_birds(rest)
    [] -> False
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [day, ..rest] -> day + total(rest)
    [] -> 0
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [day, ..rest] if day >= 5 -> busy_days(rest) + 1
    [_, ..rest] -> busy_days(rest)
    [] -> 0
  }
}
