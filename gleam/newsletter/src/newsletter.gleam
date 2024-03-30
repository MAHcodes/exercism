import gleam/result
import simplifile
import gleam/string
import gleam/list

fn parse_emails(emails: String) -> List(String) {
  emails
  |> string.trim
  |> string.split("\n")
}

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  path
  |> simplifile.read
  |> result.map(parse_emails)
  |> result.nil_error
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  path
  |> simplifile.create_file
  |> result.nil_error
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  path
  |> simplifile.append(email <> "\n")
  |> result.nil_error
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  use _ <- result.try(create_log_file(log_path))
  use emails <- result.try(read_emails(emails_path))
  use email <- list.try_each(emails)

  case send_email(email) {
    Ok(_) -> log_sent_email(log_path, email)
    _ -> Ok(Nil)
  }
}
