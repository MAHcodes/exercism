import gleam/set.{type Set}
import gleam/bool
import gleam/list
import gleam/result

pub fn new_collection(card: String) -> Set(String) {
  set.new()
  |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  case set.contains(collection, card) {
    True -> #(True, collection)
    False -> #(False, set.insert(collection, card))
  }
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

  case can_trade {
    True -> #(True, collection_after_trade)
    False -> #(False, collection_after_trade)
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(set.intersection)
  |> result.unwrap(set.new())
  |> set.to_list
}

fn do_total_cards(collections: List(Set(String)), acc: Set(String)) -> Int {
  case collections {
    [first, ..rest] -> do_total_cards(rest, set.union(first, acc))
    [] -> set.size(acc)
  }
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  do_total_cards(collections, set.new())
}

fn shiny_card(card: String) -> Bool {
  case card {
    "Shiny " <> _ -> True
    _ -> False
  }
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.to_list
  |> list.filter(shiny_card)
  |> set.from_list
}
