# notes:
# a2 + b2 = c2
# a + b + c = 1000
# c = 1000 - a - b
# a2 + b2 = (1000 - a - b)2
# a2 + b2 = 1_000_000 + a2 + 2ab - 2000a + b2 - 2000b
# 2000b - 2ab = 1_000_000 - 2000a
# b(2000 - 2a) = 1000(1000 - 2a)
# b = (1000(1000 - 2a))/(2(1000 - a))

# can start at 1000 div 3, since there are 3 components added
# go down from there as a
# substitute b and c for each

constant goal = 1000;

sub fb(\a) {
  (goal * (goal - 2*a))
    div (2 * (goal - a))
}

sub fc(\a, \b = Nil) {
  goal - a - (b // fb(a))
}

sub find-triple {
  for (goal div 3) ... 1 -> \a {
    my \b = fb(a);
    my \c = fc(a, b);
    when a < b && a**2 + b**2 == c**2 {
      return (a, b, c);
    }
  };
}

my \triple = find-triple;
my (\a, \b, \c) = triple;
say "$(a)² + $(b)² = $(c)²: $(a**2) + $(b**2) = $(c**2): $(a**2 + b**2) = $(c**2)";
say triple.reduce(* ~ " + " ~ *) ~ " = " ~ ([+] triple);
say triple.reduce(* ~ " x " ~ *) ~ " = " ~ ([*] triple);
