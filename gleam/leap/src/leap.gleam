pub fn is_leap_year(y: Int) -> Bool {
  y % 100 != 0 && y % 4 == 0 || y % 400 == 0
}
