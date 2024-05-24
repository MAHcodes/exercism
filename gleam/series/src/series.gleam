import gleam/bool
import gleam/list
import gleam/string

pub type Error {
  EmptySeries
  SliceLengthZero
  SliceLengthNegative
  SliceLengthTooLarge
}

fn do_slice(str: String, acc: List(String), len: Int, idx: Int) {
  case idx - 1 >= string.length(str) - len {
    False -> do_slice(str, [string.slice(str, idx, len), ..acc], len, idx + 1)
    True -> list.reverse(acc)
  }
}

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  let input_len = string.length(input)
  use <- bool.guard(input_len == 0, Error(EmptySeries))
  use <- bool.guard(size == 0, Error(SliceLengthZero))
  use <- bool.guard(size < 0, Error(SliceLengthNegative))
  use <- bool.guard(input_len < size, Error(SliceLengthTooLarge))

  do_slice(input, [], size, 0)
  |> Ok
}
