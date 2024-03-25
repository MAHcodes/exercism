pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

fn do_pizza_price(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita -> acc + 7
    Caprese -> acc + 9
    Formaggio -> acc + 10
    ExtraSauce(p) -> do_pizza_price(p, acc + 1)
    ExtraToppings(p) -> do_pizza_price(p, acc + 2)
  }
}

pub fn pizza_price(pizza: Pizza) -> Int {
  do_pizza_price(pizza, 0)
}

fn do_length(list: List(a), acc: Int) -> Int {
  case list {
    [_, ..rest] -> do_length(rest, acc + 1)
    [] -> acc
  }
}

fn length(list: List(a)) -> Int {
  do_length(list, 0)
}

fn fees(order: List(a)) -> Int {
  case length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
}

fn do_order_price(order: List(Pizza), acc: Int) -> Int {
  case order {
    [pizza, ..rest] -> do_order_price(rest, acc + pizza_price(pizza))
    [] -> acc
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  fees(order) + do_order_price(order, 0)
}
