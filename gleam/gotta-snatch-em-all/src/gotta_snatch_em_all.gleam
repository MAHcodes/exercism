import gleam/set.{type Set}
import gleam/bool
import gleam/list
import gleam/result
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.new()
  |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let can_trade =
    collection
    |> set.contains(my_card)
    && collection
    |> set.contains(their_card)
    |> bool.negate

  let collection_after_trade = {
    collection
    |> set.delete(my_card)
    |> set.insert(their_card)
  }

  #(can_trade, collection_after_trade)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(set.intersection)
  |> result.unwrap(set.new())
  |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.reduce(set.union)
  |> result.unwrap(set.new())
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.to_list
  |> list.filter(string.starts_with(_, "Shiny "))
  |> set.from_list
}
