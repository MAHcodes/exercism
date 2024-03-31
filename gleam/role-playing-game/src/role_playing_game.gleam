import gleam/option.{type Option, None, Some}
import gleam/int

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  player.name
  |> option.unwrap("Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 ->
      case player.level {
        lvl if lvl >= 10 -> Some(Player(..player, health: 100, mana: Some(100)))
        _ -> Some(Player(..player, health: 100))
      }
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> #(Player(..player, health: int.max(player.health, cost) - cost), 0)
    Some(mana) if mana >= cost -> #(
      Player(..player, mana: Some(mana - cost)),
      cost * 2,
    )
    _ -> #(player, 0)
  }
}
