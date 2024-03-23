pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(current_time_in_oven: Int) -> Int {
  expected_minutes_in_oven() - current_time_in_oven
}

pub fn preparation_time_in_minutes(layers_count: Int) -> Int {
  layers_count * 2
}

pub fn total_time_in_minutes(
  layers_count: Int,
  current_time_in_oven: Int,
) -> Int {
  preparation_time_in_minutes(layers_count) + current_time_in_oven
}

pub fn alarm() -> String {
  "Ding!"
}
