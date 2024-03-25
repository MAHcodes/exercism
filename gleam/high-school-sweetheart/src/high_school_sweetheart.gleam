import gleam/string
import gleam/result
import gleam/list

pub fn first_letter(name: String) -> String {
  name
  |> string.trim
  |> string.first
  |> result.unwrap("")
}

pub fn initial(name: String) -> String {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) -> String {
  full_name
  |> string.split(" ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     "
  |> string.append(initials(full_name1))
  |> string.append("  +  ")
  |> string.append(initials(full_name2))
  |> string.append(
    "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
",
  )
}
