import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  let assert Ok(digits) = int.digits(number, 10)
  let digits_count = list.length(digits)

  digits
  |> list.map(int_power(_, digits_count, 1))
  |> int.sum
  == number
}

fn int_power(base: Int, exponent: Int, acc: Int) -> Int {
  case exponent {
    0 -> acc
    _ -> int_power(base, exponent - 1, acc * base)
  }
}
