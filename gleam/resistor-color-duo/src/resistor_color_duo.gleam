import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

pub fn code(color: Color) -> Int {
  case color {
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9
  }
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  case list.length(colors) > 1 {
    True ->
      Ok(
        colors
        |> list.take(2)
        |> list.map(code)
        |> list.map(int.to_string)
        |> string.join("")
        |> int.parse
        |> result.unwrap(0),
      )
    False -> Error(Nil)
  }
}
