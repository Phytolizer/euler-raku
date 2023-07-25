sub is-palindrome($n) {
  $n.Str == $n.flip
}

sub largest-palindromic-product {
  my $max = 0;
  my $j = 990;
  for 999 ...^ 100 -> \i {
    for 990, {$_ - 11} ...^ {$_ <= 100} -> \j {
      my \product = i * j;
      when product > $max and is-palindrome(product) {
        $max = product;
      }
    }
  }
  $max
}

say largest-palindromic-product;
