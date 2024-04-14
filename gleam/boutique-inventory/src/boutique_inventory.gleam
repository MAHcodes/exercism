import gleam/iterator.{type Iterator}

pub type Item {
  Item(name: String, price: Int, quantity: Int)
}

fn item_name(item: Item) -> String {
  item.name
}

pub fn item_names(items: Iterator(Item)) -> Iterator(String) {
  items
  |> iterator.map(item_name)
}

fn cheap_item(item: Item) -> Bool {
  item.price < 30
}

pub fn cheap(items: Iterator(Item)) -> Iterator(Item) {
  items
  |> iterator.filter(cheap_item)
}

fn item_out_of_stock(item: Item) -> Bool {
  item.quantity == 0
}

pub fn out_of_stock(items: Iterator(Item)) -> Iterator(Item) {
  items
  |> iterator.filter(item_out_of_stock)
}

fn total_stock_items(acc: Int, item: Item) -> Int {
  acc + item.quantity
}

pub fn total_stock(items: Iterator(Item)) -> Int {
  items
  |> iterator.fold(0, total_stock_items)
}
