sub divisors($n is copy) {
  my $divisors = 1;
  my $count = 0;
  while $n %% 2 {
    $count++;
    $n div= 2;
  }
  $divisors *= $count + 1;
  for (3, 5 ... *) -> \p {
    last if $n == 1;

    $count = 0;
    while $n %% p {
      $count++;
      $n div= p;
    }
    $divisors *= $count + 1;
  }

  $divisors
}

sub format-time { sprintf '%010.6f', now - INIT now }

my $current;

my \compute-finished = start {
  my $i = 1;
  until divisors($i * ($i + 1) div 2) > 500 {
    $current = $i * ($i + 1) div 2;
    $i++;
  }
  $i * ($i + 1) div 2
};

my \wake = Supply.interval(10);

react {
  whenever wake {
    my $t = format-time;
    say "$t: processing $current";
  }
  whenever compute-finished -> $t {
    my $final-time = format-time;
    say "$final-time: $t";
    done;
  }
}
