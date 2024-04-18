import gleam/list

fn do_proteins(rna: String, acc: List(String)) -> Result(List(String), Nil) {
  case rna {
    "AUG" <> rest -> do_proteins(rest, ["Methionine", ..acc])
    "UUU" <> rest | "UUC" <> rest -> do_proteins(rest, ["Phenylalanine", ..acc])
    "UUA" <> rest | "UUG" <> rest -> do_proteins(rest, ["Leucine", ..acc])
    "UCU" <> rest | "UCC" <> rest | "UCA" <> rest | "UCG" <> rest ->
      do_proteins(rest, ["Serine", ..acc])
    "UAU" <> rest | "UAC" <> rest -> do_proteins(rest, ["Tyrosine", ..acc])
    "UGU" <> rest | "UGC" <> rest -> do_proteins(rest, ["Cysteine", ..acc])
    "UGG" <> rest -> do_proteins(rest, ["Tryptophan", ..acc])
    "" | "UAA" <> _ | "UAG" <> _ | "UGA" <> _ -> Ok(list.reverse(acc))
    _ -> Error(Nil)
  }
}

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  do_proteins(rna, [])
}
