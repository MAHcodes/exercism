import gleam/list
import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0b00 -> Ok(Adenine)
    0b01 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

fn do_encode(dna: List(Nucleotide), acc: BitArray) -> BitArray {
  case dna {
    [first, ..rest] -> do_encode(rest, <<acc:bits, encode_nucleotide(first):2>>)
    [] -> acc
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  do_encode(dna, <<>>)
}

fn do_decode(
  dna: BitArray,
  acc: List(Nucleotide),
) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<first:2, rest:bits>> -> {
      use nucleotide <- result.try(decode_nucleotide(first))
      do_decode(rest, [nucleotide, ..acc])
    }
    <<>> -> Ok(list.reverse(acc))
    _ -> Error(Nil)
  }
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  do_decode(dna, [])
}
