import gleam/option.{type Option}
import gleam/string

pub fn two_fer(name: Option(String)) -> String {
  name
  |> option.unwrap("you")
  |> string.append("One for ", _)
  |> string.append(", one for me.")
}
