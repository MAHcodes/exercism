import gleam/int
import gleam/list
import gleam/string

const sounds = [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]

pub fn convert(n: Int) -> String {
  case
    sounds
    |> list.map(fn(sound) {
      case n % sound.0 {
        0 -> sound.1
        _ -> ""
      }
    })
    |> string.concat
  {
    "" -> int.to_string(n)
    raindrops -> raindrops
  }
}
