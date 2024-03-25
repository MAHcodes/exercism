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

fn do_order_price(order: List(Pizza), acc: Int) -> Int {
  case order {
    [pizza, ..rest] -> do_order_price(rest, acc + pizza_price(pizza))
    [] -> acc
  }
}

fn fees(order: List(Pizza)) -> Int {
  case order {
    [_] -> 3
    [_, _] -> 2
    _ -> 0
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  do_order_price(order, fees(order))
}
