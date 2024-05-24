import gleam/list
import gleam/string

pub type Resistance {
  Resistance(unit: String, value: Int)
}

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

fn color(c: String) -> Result(Color, Nil) {
  case c {
    "black" -> Ok(Black)
    "brown" -> Ok(Brown)
    "red" -> Ok(Red)
    "orange" -> Ok(Orange)
    "yellow" -> Ok(Yellow)
    "green" -> Ok(Green)
    "blue" -> Ok(Blue)
    "violet" -> Ok(Violet)
    "grey" -> Ok(Grey)
    "white" -> Ok(White)
    _ -> Error(Nil)
  }
}

fn code(color: Color) -> Int {
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

fn unit(c: Color) -> String {
  case c {
    Black | Brown -> ""
    Red | Orange | Yellow | Green -> "kilo"
    Blue | Violet | Grey -> "mega"
    White -> "giga"
  }
  |> string.append("ohms")
}

fn mul(c: Color) -> Int {
  case c {
    Black -> 1
    _ -> 10
  }
}

fn values(colors: List(Color)) -> Result(Resistance, Nil) {
  case colors {
    [a, b, c, ..] ->
      Ok(Resistance(
        unit: unit(c),
        value: code(a) * value(c) * mul(b) + code(b) * value(c),
      ))
    _ -> Error(Nil)
  }
}

fn value(c: Color) -> Int {
  case c {
    Brown | Yellow -> 10
    _ -> 1
  }
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  list.map(colors, fn(clr) {
    let assert Ok(c) = color(clr)
    c
  })
  |> values
}
