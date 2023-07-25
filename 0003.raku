# simple trial division
sub largest-prime-factor($n, $divisor = 2) {
  # base case, divisor > sqrt(n) means $n is the largest prime factor of the original input
  when $divisor ** 2 > $n {
    $n
  }
  when $n %% $divisor {
    # retain divisor, reduce n
    largest-prime-factor($n div $divisor, $divisor)
  }
  default {
    # try next divisor
    largest-prime-factor($n, $divisor.succ)
  }
}

say largest-prime-factor(600851475143);
