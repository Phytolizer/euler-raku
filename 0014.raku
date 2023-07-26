constant limit = 1_000_000;

my %cache := :{1 => 1};

sub hailstone(\n) {
  %cache{n} // do {
    my \result = do given n % 2 {
      when 0 { hailstone(n div 2) + 1 }
      when 1 { hailstone(3*n + 1) + 1 }
    };
    %cache{n} = result;
    result
  }
}

sub format-time { sprintf '%010.6f', now - INIT now }

my $max = 1;
my $max-input = 1;
for (limit ...^ 1) -> \x {
  my \new = hailstone(x);
  if new > $max {
    $max = new;
    $max-input = x;
  }
  if x %% 10000 {
    say "$(format-time) $(x)";
  }
}
say "$(format-time): $max-input";
