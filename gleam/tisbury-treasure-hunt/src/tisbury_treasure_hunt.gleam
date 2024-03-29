pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location.0 == treasure_location.1
  && place_location.1 == treasure_location.0
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  case treasures {
    [treasure, ..rest] -> {
      case treasure_location_matches_place_location(place.1, treasure.1) {
        True -> 1 + count_place_treasures(place, rest)
        False -> count_place_treasures(place, rest)
      }
    }
    [] -> 0
  }
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case found_treasure.0 {
    "Brass Spyglass" -> True
    "Amethyst Octopus" ->
      case desired_treasure.0 {
        "Crystal Crab" | "Glass Starfish" -> True
        _ -> False
      }
    "Vintage Pirate Hat" ->
      case place.0 {
        "Old Schooner" -> False
        _ ->
          case desired_treasure.0 {
            "Model Ship in Large Bottle" | "Antique Glass Fishnet Float" -> True
            _ -> False
          }
      }
    _ -> False
  }
}
