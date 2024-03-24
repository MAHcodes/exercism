import gleam/list
import gleam/int

fn do_first_n(n: Int, l: List(Int)) -> List(Int) {
  case n {
    0 -> l
    _ -> do_first_n(n - 1, [n, ..l])
  }
}

fn first_n(n: Int) -> List(Int) {
  do_first_n(n, [])
}

fn square(n: Int) -> Int {
  n * n
}

pub fn square_of_sum(n: Int) -> Int {
  n
  |> first_n
  |> int.sum
  |> square
}

pub fn sum_of_squares(n: Int) -> Int {
  n
  |> first_n
  |> list.map(square)
  |> int.sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
