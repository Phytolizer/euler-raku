say sum
  # range 0..^1000
  ^1000
    # filter by multiple of either
    .grep(* %% (3 | 5))
