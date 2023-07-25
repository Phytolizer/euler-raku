sub nth-prime-upper-bound($n) {
  ceiling $n * (log($n) + log(log $n) + 2)
}

my \n = 10001;
my \upper-bound = nth-prime-upper-bound(n);
say "upper bound is $(upper-bound)";

my @reject;
my $nth-prime;
my $i = 1;

for 2 ... upper-bound -> \x {
  if @reject[x] { next; }

  $nth-prime = x;
  if $i == n { last; }
  $i++;
  for (2 * x), (* + x) ...^ (* > upper-bound) -> \mult {
    @reject[mult] = True;
  }
}

say $nth-prime;
