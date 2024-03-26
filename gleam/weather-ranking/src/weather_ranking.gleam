import gleam/order.{type Order}
import gleam/float
import gleam/list

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

fn temperature_to_celsius(temp: Temperature) -> Float {
  case temp {
    Celsius(t) -> t
    Fahrenheit(t) -> fahrenheit_to_celsius(t)
  }
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  float.compare(temperature_to_celsius(left), temperature_to_celsius(right))
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> list.sort(fn(a, b) { compare_temperature(a.temperature, b.temperature) })
}
