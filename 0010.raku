constant \n = 2_000_000;

=begin slow
my $sum = 0;

sub format-time { sprintf '%010.6f', now - INIT now }

my $x = 0;
my @reject;

my \compute-finished = start {
  for 2 ...^ n {
    $x = $_;
    if @reject[$x] {
      next;
    }

    $sum += $x;

    for ($x, 2 * $x ...^ n) {
      @reject[$_] = True;
    }
  }
}

my \wake = Supply.interval(10);

react {
  whenever wake {
    my $t = format-time;
    say "$t: processing $x";
  }
  whenever compute-finished {
    my $final-time = format-time;
    say "$final-time: $sum";
    done;
  }
}
=end slow

my \r = n.sqrt.floor;
die unless r**2 <= n && (r + 1)**2 > n;
my @V = (1 ... r).map(n div *);
@V = (@V, (@V[*-1] ... 1)).flat;
my %S = @V.map({ ($_, $_ * ($_ + 1) div 2 - 1) }).flat;
for 2 ... r -> $p {
  when %S{$p} > %S{$p - 1} {
    my $sp = %S{$p - 1};
    my $p2 = $p**2;
    for @V -> $v {
      last if $v < $p2;
      %S{$v} -= $p * (%S{$v div $p} - $sp);
    }
  }
}
say %S{n};
