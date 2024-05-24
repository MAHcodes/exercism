import gleam/list

pub type Usd

pub type Eur

pub type Jpy

pub opaque type Money(currency) {
  Money(amount: Int)
}

pub fn dollar(amount: Int) -> Money(Usd) {
  Money(amount)
}

pub fn euro(amount: Int) -> Money(Eur) {
  Money(amount)
}

pub fn yen(amount: Int) -> Money(Jpy) {
  Money(amount)
}

fn add_money(a: Money(currency), b: Money(currency)) -> Money(currency) {
  a.amount + b.amount
  |> Money
}

pub fn total(prices: List(Money(currency))) -> Money(currency) {
  prices
  |> list.fold(Money(0), add_money)
}
