import gleam/list
import gleam/int

fn square(n: Int) -> Int {
  n * n
}

pub fn square_of_sum(n: Int) -> Int {
  n
  |> list.range(1, _)
  |> int.sum
  |> square
}

pub fn sum_of_squares(n: Int) -> Int {
  n
  |> list.range(1, _)
  |> list.map(square)
  |> int.sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
