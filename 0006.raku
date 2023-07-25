sub triangle($n) {
  $n * ($n + 1)
    div 2
}

sub pyramid($n) {
  $n * ($n + 1) * (2*$n + 1)
    div 6
}

say { triangle($_) ** 2 - pyramid($_) }(100);
